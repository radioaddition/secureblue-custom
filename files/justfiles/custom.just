alias brave := install-brave
# Install the brave browser. Not included by default due to security concerns regarding MV2. Flatpak is advised against as the developers themselves state that it isn't as well maintained
install-brave:
	rpm-ostree install brave-browser
alias nix := install-nix
# Installs the Determinate Systems version of the Nix package manager, which claims to be fully compatible with SELinux. The Secureblue developers advise against this
install-nix:
	run0 sh -c 'curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate'
# Remove the Nix package manager
remove-nix:
	/nix/nix-installer uninstall
alias rust := install-rust
# Installs the rust toolkit, which includes the cargo package manager
install-rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
[no-cd]
_setup_gnomintosh:
	#!/usr/bin/env bash
	git clone https://github.com/jothi-prasath/gnomintosh.git
	cd gnomintosh
	chmod a+x main.sh
	./main.sh install
