use arma_rs::{arma, Extension};
use process_path::get_executable_path;
use soloud::*;

#[arma]
fn init() -> Extension {
    Extension::build()
        .version("1.0.0".to_string())
        .command("play", play_music)
        .finish()
}

pub fn play_music(name: String) -> String {
    let name_copy = name.clone();
    std::thread::spawn(move || {
    let path = get_executable_path().unwrap();
    let file_path = path.parent().unwrap().join("!Workshop").join("@42nd R.T.F").join(name_copy).to_str().unwrap().to_string();
    let sl: Soloud = Soloud::default().unwrap();
    if !std::path::Path::new(&file_path).exists() {
        return format!("File not found: {}", file_path);
    }

    let mut wav = audio::Wav::default();
    wav.load(&std::path::Path::new(&file_path)).unwrap();
    sl.play(&wav);
    while sl.voice_count() > 0 {
        std::thread::sleep(std::time::Duration::from_millis(100));
    }
    format!("Finished playing: {}", file_path)
    });
    format!("Playing: {}", name)
}
