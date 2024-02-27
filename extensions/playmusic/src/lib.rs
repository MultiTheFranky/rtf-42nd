use arma_rs::{arma, Context, ContextState, Extension};

use process_path::get_executable_path;
use soloud::*;

#[arma]
fn init() -> Extension {
    Extension::build()
        .version("1.0.0".to_string())
        .command("play", play_music)
        .command("stop", stop)
        .state(Soloud::default().unwrap())
        .finish()
}

pub fn stop(ctx: Context) -> Result<(), ()> {
    ctx.global().get::<Soloud>().unwrap().stop_all();
    Ok(())
}

pub fn play_music(ctx: Context, name: String)  -> Result<(), ()> {
    let name_copy = name.clone();
    std::thread::spawn(move || {
        let path = get_executable_path().unwrap();
        let file_path = path.parent().unwrap().join("!Workshop").join("@42nd R.T.F").join(name_copy.clone()).to_str().unwrap().to_string();
        if !std::path::Path::new(&file_path).exists() {
            return format!("File not found: {}", file_path);
        }
        let sl = ctx.global().get::<Soloud>().unwrap();
        let mut wav = audio::Wav::default();
        wav.load(&std::path::Path::new(&file_path)).unwrap();
        sl.play(&wav);
        // Wait for the audio to finish playing
        while sl.active_voice_count() > 0 {
            std::thread::sleep(std::time::Duration::from_millis(100));
        }
        format!("Finished: {}", name_copy)
    });
    Ok(())
}
