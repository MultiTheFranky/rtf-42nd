use std::thread;

use arma_rs::{arma, Extension};
use influxc::{Client, Precision, Record};

#[arma]
fn init() -> Extension {
    Extension::build()
        .version("1.0.0".to_string())
        .command("data", data)
        .finish()
}

struct Arma3Data {
    key: String,
    value: i64,
}

pub fn data(endpoint: String, token: String, org: String, bucket: String, data: [String;7]) -> Result<String, String> {
    let bucket_clone = bucket.clone();
    thread::spawn(move || {
    let mut client = Client::build(format!("https://{}", endpoint), 
            influxc::Credentials::from_token(&token)
    ).finish();
    if client.is_err() {
        return Err(client.err().unwrap().to_string());
    }
    
    for d in data.iter() {
        let mut rec = Record::new(&org, &bucket)
        .precision(Precision::Milliseconds);
        let parsed = parse_data(d.to_string());
        rec.measurement(&parsed.key)
            .field("value", parsed.value);
        let result = client.as_mut().unwrap().write(&rec);
        if result.is_err() {
            return Err(result.err().unwrap().to_string());
        }
    }
    Ok(format!("Data sent to {}", bucket))
    });
    
    Ok(format!("Data sent to {}", bucket_clone))
}

fn parse_data(data: String) -> Arma3Data {
    let mut split = data.split(":");
    Arma3Data {
        key: split.next().unwrap().to_string(),
        value: split.next().unwrap().parse().unwrap(),
    }
}
#[test]
fn test_parse_data() {
    let data = "test:1".to_string();
    let parsed = parse_data(data);
    assert_eq!(parsed.key, "test".to_string());
    assert_eq!(parsed.value, 1);
}

#[test]
fn test_data() {
    let extension = init().testing();
    let (output, _) = extension.call("data", Some(vec![
        "http://localhost:8086".to_string(),
        "token".to_string(),
        "org".to_string(),
        "bucket".to_string(),
        "test:Test data:1.0".to_string(),
        "test:Test data:2.0".to_string(),
        "test:Test data:3.0".to_string(),
        "test:Test data:4.0".to_string(),
        "test:Test data:5.0".to_string(),
        "test:Test data:6.0".to_string(),
        "test:Test data:7.0".to_string(),
    ]));
    assert_eq!(output, "Data sent to bucket");
}


