use arma_rs::{arma, Extension};

use dns_lookup::lookup_host;

#[arma]
fn init() -> Extension {
    Extension::build()
        .version("1.0.0".to_string())
        .command("data", data)
        .finish()
}

pub fn data(hostname: String) -> Result<String, String> {
    let ips: Vec<std::net::IpAddr> = lookup_host(&hostname).unwrap();
    Ok(ips[0].to_string())
}
