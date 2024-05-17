# Nixfiles

System config using [NixOS](https://nixos.org/learn/) & [home-manager](https://nix-community.github.io/home-manager/). Usage requires [Flakes](https://nixos.wiki/wiki/Flakes).

## Structure

I have a relatively simple single-`loz`-user setup for one host.

- `flake.nix`: entrypoint for system and user config
- `home-manager/`
  - `cli/`: non-gui config for import
  - `desktop/`: gui config for import
  - `${hostname}.nix`: host specific home config
- `hosts/`
  - `common/`: config for import
    - `input/`: input device config
    - `users/`: standard user config from any `../hostname/default.nix` config
  - `${hostname}/`: host specific config with `default.nix` utilizing imports and generated `hardware-configuration.nix`
- `shell.nix`: use with `nix develop` for bootstrapping a machine

## Use

From repo root:

```bash
# Build and activate new system config
sudo nixos-rebuild switch --flake .#hostname
```

```bash
# Build and activate new user config
home-manager switch --flake .#loz@hostname
```

```bash
# Start an ephemeral subshell with random package to test
nix shell nixpkgs#random
```

```bash
# Subshell for bootstrapping (or developing)
nix develop
```

```bash
# Update system (nixos-rebuild after)
nix flake update

# Or replace only a specific package, such as home-manager (nixos-rebuild after)
nix flake lock --update-input home-manager
```

## Troubleshooting

- `cached failure of attribute`: Flake usage can cache eval errors leading to this ambiguous error without much context
  - There is an [open issue](https://github.com/NixOS/nix/issues/3872) discussion, with [best suggestion](https://github.com/NixOS/nix/issues/3872#issuecomment-1637052258) being the use of `--option eval-cache false`
- `No such file or directory`: For flakes in git repos, only files in the working tree will be copied to the store, therefore be sure to `git add` anything new

## Special thanks to

- [Misterio77's config](https://github.com/Misterio77/nix-config) and great [nix-starter-config](https://github.com/Misterio77/nix-starter-configs)
