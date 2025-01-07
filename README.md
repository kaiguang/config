# My config files

## HOME

The `~` home directory.

### HOME/dotconfig

The `~/.config` directory, dot prefix is replaced with word 'dot' to prevent macOS hiding dot files by default.

Similar replacement for dotzshrc, dotgitconfig, etc.

When using the config files, swap back the dot prefix.

## BetterTouchTool

Exported using the BetterTouchTool UI, triggers and settings.

Can be imported from the same BetterTouchTool UI.

## Raycast

Password protected config file, exported using Raycast, can be imported using Raycast, just search export / import.

Include Settings (including aliases, hotkeys & favorites), Extensions, Floating Notes, Quicklinks, Script Directories, Snippets.

## Vimium

Exported using the extension's settings page.

Can be imported using the extensions 'Backup and Restore' feature under the setting's page.

## Docker

```sh
# Add the --no-cache option if you want everything fresh, or if you want to
# change the secret env vars.
SSH_KEY_PUB="one line public key" \
SSH_KEY_PRIV=$(
cat <<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
multiline private key
-----END OPENSSH PRIVATE KEY-----
EOF
) \
docker build \
--secret id=SSH_KEY_PUB \
--secret id=SSH_KEY_PRIV \
-t kai-ubuntu .

# Create and run the container detached
docker run -tid --name kai kai-ubuntu

# Cleanups
docker stop kai
docker rm kai
```
