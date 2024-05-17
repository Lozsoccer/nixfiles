{pkgs, ...}: {
  imports = [
    ./element.nix
    ./firefox.nix
    ./flameshot.nix
    ./font.nix
    ./gnome.nix
    ./kitty.nix
    ./theme.nix
    ./wayland.nix
  ];
}
