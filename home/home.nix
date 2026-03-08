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
    ./modules/fish
    ./modules/alacritty
    ./modules/starship
    ./modules/direnv.nix
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
    obsidian
    ungoogled-chromium
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
    docker-compose
    zed-editor
    ksnip
    starship
  ];

  services = {
    syncthing = {
      enable = true;
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
