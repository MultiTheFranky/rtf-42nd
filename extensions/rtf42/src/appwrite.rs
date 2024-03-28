use arma_rs::IntoArma;
use serde::{ Deserialize, Serialize };

use crate::Player;
pub struct Configuration {
    pub base_path: String,
    pub client: reqwest::blocking::Client,
}

impl Configuration {
    fn new(base_path: String, client: reqwest::blocking::Client) -> Self {
        Configuration {
            base_path,
            client,
        }
    }
}

pub struct Appwrite {
    configuration: Configuration,
}

impl Appwrite {
    pub fn new(end_point: &str, project_id: &str, api_key: &str) -> Self {
        let mut headers = reqwest::header::HeaderMap::new();
        headers.insert("X-Appwrite-key", api_key.to_string().parse().unwrap());
        headers.insert("X-Appwrite-Project", project_id.to_string().parse().unwrap());
        headers.insert("Content-Type", "application/json".parse().unwrap());

        let client = reqwest::blocking::ClientBuilder
            ::new()
            .default_headers(headers)
            .build()
            .unwrap();
        let configuration = Configuration::new(end_point.to_string(), client);
        Appwrite { configuration }
    }

    pub fn get(&self, path: &str) -> Result<reqwest::blocking::Response, reqwest::Error> {
        let local_var_uri_str = format!("{}/{}", self.configuration.base_path, path);
        let request_builder = self.configuration.client.get(&local_var_uri_str).build().unwrap();
        self.configuration.client.execute(request_builder)
    }

    pub fn post(&self, path: &str, body: &str) -> Result<reqwest::blocking::Response, reqwest::Error> {
        let local_var_uri_str = format!("{}/{}", self.configuration.base_path, path);
        let request_builder = self.configuration.client.post(&local_var_uri_str).body(body.to_string()).build().unwrap();
        self.configuration.client.execute(request_builder)
    }

    pub fn put(&self, path: &str, body: &str) -> Result<reqwest::blocking::Response, reqwest::Error> {
        let local_var_uri_str = format!("{}/{}", self.configuration.base_path, path);
        let request_builder = self.configuration.client.put(&local_var_uri_str).body(body.to_string()).build().unwrap();
        self.configuration.client.execute(request_builder)
    }

    pub fn patch(&self, path: &str, body: &str) -> Result<reqwest::blocking::Response, reqwest::Error> {
        let local_var_uri_str = format!("{}/{}", self.configuration.base_path, path);
        let request_builder = self.configuration.client.patch(&local_var_uri_str).body(body.to_string()).build().unwrap();
        self.configuration.client.execute(request_builder)
    }

    pub fn delete(&self, path: &str) -> Result<reqwest::blocking::Response, reqwest::Error> {
        let local_var_uri_str = format!("{}/{}", self.configuration.base_path, path);
        let request_builder = self.configuration.client.delete(&local_var_uri_str).build().unwrap();
        self.configuration.client.execute(request_builder)
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub struct LoadoutDocument {
    #[serde(rename = "$id")]
    pub id: String,
    pub loadout: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct PlayerDocument {
    #[serde(rename = "$id")]
    pub id: String,
    pub name: String,
    pub loadout: Option<LoadoutDocument>,
    pub group: Option<String>,
}

pub fn get_document(
    appwrite: &Appwrite,
    database: &str,
    collection: &str,
    document: &str
) -> Result<PlayerDocument, String> {
    let local_var_uri_str = format!(
        "databases/{databaseId}/collections/{collectionId}/documents/{documentId}",
        databaseId = database,
        collectionId = collection,
        documentId = document
    );
    let response = match appwrite.get(&local_var_uri_str) {
        Ok(response) => response,
        Err(e) => {
            return Err(e.to_string());
        }
    };
    if (response.status().as_u16() < 200) || (response.status().as_u16() > 299) {
        return Err(response.text().unwrap());
    }
    println!("{:?}", response);
    let player_document = match response.json::<PlayerDocument>() {
        Ok(player_document) => player_document,
        Err(e) => {
            return Err(e.to_string());
        }
    };

    Ok(player_document)
}

pub fn write_document(
    appwrite: &Appwrite,
    database: &str,
    collection: &str,
    document: &str,
    data: PlayerDocument
) -> Result<PlayerDocument, String> {
    let local_var_uri_str = format!(
        "databases/{databaseId}/collections/{collectionId}/documents/{documentId}",
        databaseId = database,
        collectionId = collection,
        documentId = document
    );
    let data = serde_json::to_string(&data).unwrap();
    let response = match appwrite.put(&local_var_uri_str, &data) {
        Ok(response) => response,
        Err(e) => {
            return Err(e.to_string());
        }
    };
    if (response.status().as_u16() < 200) || (response.status().as_u16() > 299) {
        return Err(response.text().unwrap());
    }
    let player_document = match response.json::<PlayerDocument>() {
        Ok(player_document) => player_document,
        Err(e) => {
            return Err(e.to_string());
        }
    };
    Ok(player_document)
}
