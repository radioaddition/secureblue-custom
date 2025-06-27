# secureblue-custom &nbsp; [![bluebuild build badge](https://github.com/radioaddition/secureblue-custom/actions/workflows/build.yml/badge.svg)](https://github.com/radioaddition/secureblue-custom/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

First, install [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/)
Then, rebase to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/radioaddition/$IMAGE:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/radioaddition/$IMAGE:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
- Where `$IMAGE` is one of:
  - `secureblue-custom-gnome`
  - `secureblue-custom-gnome-lts`
  - `secureblue-custom-kde`
  - `secureblue-custom-kde-lts`
  - `secureblue-custom-cosmic`
  - `secureblue-custom-cosmic-lts`
  - `secureblue-custom-sway`
  - `secureblue-custom-sway-lts`

NOTE: cosmic is currently not recommended due to a lack of screen security and instability. I most likely won't update the recipe for this image until this is changed. the image will still receive automatic updates from upstream

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/radioaddition/secureblue-custom-$IMAGE
```
