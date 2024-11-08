# secureblue-custom &nbsp; [![bluebuild build badge](https://github.com/radioaddition/secureblue-custom/actions/workflows/build.yml/badge.svg)](https://github.com/radioaddition/secureblue-custom/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

After setup, it is recommended you update this README to describe your custom image.

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/radioaddition/secureblue-custom:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/radioaddition/secureblue-custom:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Hyprland setup dependencies

The hyprland dots files being used were originally made for arch-based distros, so a couple of dependencies are missing in the fedora repos. To fix this, there are 2 options.

### Using Nix

`echo "extra-experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf`
`nix profile install nixpkgs#{blueberry,matugen,python312Packages.material-color-utilities}`
Or, add the following packages to your home-manager configuration if you have one
```
blueberry
gradience
```

### Using distrobox

`ujust assemble` then enter 2
`distrobox enter arch`
```
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..
rm -rf paru-bin
```
`paru -Syu blueberry --noconfirm`
`distrobox-export -b $(which blueberry)`

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/radioaddition/secureblue-custom
```
