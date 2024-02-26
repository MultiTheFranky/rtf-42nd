use arma_rs::{arma, Extension};
use fltk::{
    app,
    enums::*,
    frame::*,
    prelude::*,
    window::*,
};
mod power_button;
use power_button::PowerButton;
use std::cell::RefCell;
use std::rc::Rc;
mod fancy_slider;
use fancy_slider::FancySlider;
use process_path::get_executable_path;
use soloud::*;

#[arma]
fn init() -> Extension {
    Extension::build()
        .version("1.0.0".to_string())
        .command("play", play_music)
        .finish()
}

// Window to control volume using fltk and a slider to control the volume
fn window(track: String) {
    let app = app::App::default();
    let mut wind = DoubleWindow::default()
        .with_size(400, 300)
        .center_screen()
        .with_label("Intro music");
    wind.make_resizable(true);

    let mut title = Frame::new(160, 40, 80, 40, "You can control the volume or \nstop the intro music here");
    title.set_label_size(20);
    title.set_label_color(Color::White);
    let mut slider = FancySlider::new(50, 150);
    slider.set_range(0.0, 1.0);
    slider.set_value(1.0);
    let mut but = PowerButton::new(160, 210);

    let sl = Soloud::default().unwrap();

    wind.set_color(Color::Black);
    wind.end();
    wind.show();

    let sl = Rc::from(RefCell::from(sl));
    let mut wav = audio::Wav::default();
    wav.load(&std::path::Path::new(&track)).unwrap();
    sl.borrow().play(&wav);
    but.set_callback({
        let sl = sl.clone();
        move |_| {
            if sl.borrow().active_voice_count() > 0 {
                // Checks that no active audio is playing
                sl.borrow().stop_all();
                app.quit();
                return;
            }
            while sl.borrow().active_voice_count() > 0 {
                app.wait();
            }
        }
    });

    slider.handle({
        let sl = sl.clone();
        move |s, ev| match ev {
            Event::Push => true,
            Event::Drag => {
                let slider_value = s.value() as f32;
                sl.borrow_mut().set_global_volume(slider_value);
                app::redraw();
                true
            }
            _ => false,
        }
    });

    wind.set_callback(move |_| {
        // Triggered when the window closes
        sl.borrow().stop_all(); // Stop any playing audio before quitting
        app.quit();
    });

    app.run().unwrap();
}

pub fn play_music(name: String) -> String {
    let name_copy = name.clone();
    std::thread::spawn(move || {
        let path = get_executable_path().unwrap();
        let file_path = path.parent().unwrap().join("!Workshop").join("@42nd R.T.F").join(name_copy.clone()).to_str().unwrap().to_string();
        if !std::path::Path::new(&file_path).exists() {
            return format!("File not found: {}", file_path);
        }
        window(file_path);
        format!("Playing: {}", name_copy)
    });
    format!("Playing: {}", name)
}
