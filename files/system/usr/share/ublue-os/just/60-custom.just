alias brave := install-brave
install-brave: # Install the brave browser. Not included by default due to security concerns regarding MV2. Flatpak is advised against as the developers themselves state that it isn't as well maintained
  rpm-ostree install brave-browser
alias nix := install-nix
install-nix: # Installs the Determinate Systems version of the Nix package manager, which claims to be fully compatible with SELinux. The Secureblue developers advise against this
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
remove-nix: # Remove the Nix package manager
  /nix/nix-installer uninstall
