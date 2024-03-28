use arma_rs::{ arma, loadout::Loadout, Extension, FromArma, IntoArma, Value };

mod appwrite;

#[cfg(test)]
mod tests;

#[arma]
fn init() -> Extension {
    Extension::build().version("1.0.0".to_string())
    .command("getLoadout", get_loadout)
    .command("writeLoadout", write_loadout)
    .finish()
}

#[derive(Default, PartialEq, Debug)]
pub struct Player {
    id: String,
    name: String,
    loadout: Loadout,
    group: String,
}

impl IntoArma for Player {
    fn to_arma(&self) -> Value {
        Value::Array(
            vec![
                Value::String(self.id.clone()),
                Value::String(self.name.clone()),
                self.loadout.to_arma().clone()
            ]
        )
    }
}

pub fn get_loadout(
    endpoint: String,
    project: String,
    api_key: String,
    uid: String
) -> Result<Player, String> {
    let client = appwrite::Appwrite::new(&endpoint, &project, &api_key);

    let get_player_document = match appwrite::get_document(&client, "base", "players", &uid) {
        Ok(document) => document,
        Err(e) => {
            return Err(e.to_string());
        }
    };
    let player_data = get_player_document;
    let player = Player {
        id: player_data.id,
        name: player_data.name,
        loadout: Loadout::from_arma(
            player_data.loadout.unwrap().loadout
        ).unwrap(),
        group: player_data.group.unwrap()
    };

    Ok(player)
}

pub fn write_loadout(
    endpoint: String,
    project: String,
    api_key: String,
    uid: String,
    name: String,
    loadout: String,
    group: String
) -> Result<Player, String> {
    let client = appwrite::Appwrite::new(&endpoint, &project, &api_key);
    let uid_copy = uid.clone();

    let player_data = appwrite::PlayerDocument {
        id: "".to_string(),
        name: name,
        loadout: Some(appwrite::LoadoutDocument {
            id: "".to_string(),
            loadout: loadout
        }),
        group: Some(group.to_string())
    };

    let write_player_document = match appwrite::write_document(&client, "base", "players", &uid_copy, player_data) {
        Ok(document) => document,
        Err(e) => {
            return Err(e.to_string());
        }
    };

    let player = Player {
        id: write_player_document.id,
        name: write_player_document.name,
        loadout: Loadout::from_arma(
            write_player_document.loadout.unwrap().loadout
        ).unwrap(),
        group: write_player_document.group.unwrap()
    };

    Ok(player)
}

