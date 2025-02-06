alias brave := install-brave
# Install the brave browser. Not included by default due to security concerns regarding MV2. Flatpak is advised against as the developers themselves state that it isn't as well maintained
install-brave:
	@rpm-ostree install brave-browser
alias nix := install-lix
alias install-nix := install-lix
alias lix := install-lix
# Installs Lix, a community-focused alternative to the Nix package manager, fully compatible with all Nix features, and claims to be fully compatible with SELinux. The Secureblue developers advise against this
install-lix:
	#! /bin/run0 /bin/bash
	curl -sSf -L https://install.lix.systems/lix | sh -s -- install
# Remove Lix
remove-nix:
	#! /bin/run0 /bin/bash
	/nix/nix-installer uninstall --no-confirm
alias rust := install-rust
# Installs the rust toolkit, which includes the cargo package manager
install-rust:
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Temporarily installs sudo until next reboot, useful for some install scripts. Be sure to reboot as soon as you're done
tempsudo:
	#! /bin/run0 /bin/bash
	ostree admin unlock
	dnf5 install sudo -y
