# Installing missing dependencies
This is specific to the Hyprland image
As the dotfiles for this image are originally made for arch, not all of the dependencies are available on the fedora repos or copr. Please install them below

Sass: `brew install sass/sass/sass`

Anyrun:
```
ujust assemble # select "arch" or "all"
distrobox enter arch
sudo pacman -Syu git base-devel
git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin
makepkg -si
paru -Syu anyrun-git
distrobox-export -b $(which anyrun)
```
Pywal: `pip install pywal`
