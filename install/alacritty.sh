git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
cd .. && rm -rf alacritty
