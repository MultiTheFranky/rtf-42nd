use std::{collections::HashMap, thread};

use arma_rs::{arma, Extension, Value};
use influxc::{Client, Precision, Record};

#[arma]
fn init() -> Extension {
    Extension::build()
        .version("1.0.0".to_string())
        .command("data", data)
        .finish()
}

pub fn data(endpoint: String, token: String, org: String, bucket: String, data: HashMap<String, Value>) -> Result<String, String> {
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
        rec.measurement(d.0)
            .field("value", d.1.to_string());
        let result = client.as_mut().unwrap().write(&rec);
        if result.is_err() {
            return Err(result.err().unwrap().to_string());
        }
    }
    Ok(format!("Data sent to {}", bucket))
    });

    Ok(format!("Data sent to {}", bucket_clone))
}


