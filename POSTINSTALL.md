# Installing missing dependencies
This is specific to the Hyprland image
As the dotfiles for this image are originally made for arch, not all of the dependencies are available on the fedora repos or copr. Please install them below
Sass: `brew install sass/sass/sass`
Anyrun:
First, set up build dependencies:
```
ujust assemble # select "fedora" or "all"
distrobox enter fedora
sudo dnf install cargo
```
Then, build & install the package
```
 # Clone the repository and move to the cloned location
git clone https://github.com/Kirottu/anyrun.git && cd anyrun

# Build all packages, and install the Anyrun binary
cargo build --release
cargo install --path anyrun/

# Create the config directory and the plugins subdirectory
mkdir -p ~/.config/anyrun/plugins

# Copy all of the built plugins to the correct directory
cp target/release/*.so ~/.config/anyrun/plugins

# Copy the default config file
cp examples/config.ron ~/.config/anyrun/config.ron
```
Pywal: `pip install pywal`
