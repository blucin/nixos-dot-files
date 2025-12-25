{ pkgs, inputs, ... }:
let
  username = "blucin";
  homeDirectory = "/home/blucin";
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    ./modules/i3
    ./modules/dunst
    ./modules/polybar
    ./modules/fish
    ./modules/rofi
    ./modules/alacritty
    ./modules/starship
    ./modules/nodejs.nix
    ./modules/rust.nix
    ./modules/git.nix
    ./modules/zen-browser.nix
    ./modules/theme.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;

  home.packages = with pkgs; [
    alacritty
    bat
    btop
    copyq
    easyeffects
    feh
    obsidian
    polybarFull
    ungoogled-chromium
    dunst
    git
    gimp3
    htop
    lazygit
    lens
    home-manager
    just
    vesktop
    neovim
    ncdu
    nitch
    nil
    nitrogen
    docker-compose
    zed-editor
    rofi
    ksnip
    starship
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xarchiver
  ];

  services = {
    syncthing = {
      enable = true;
    };
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
