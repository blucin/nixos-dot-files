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
    ./modules/git.nix
    ./modules/zen-browser.nix
    ./modules/theme.nix
    ./modules/java.nix
    ./modules/openwebui.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;

  home.packages = with pkgs; [
    alacritty
    bat
    btop
    easyeffects
    obsidian
    opencode
    vscode-fhs
    anki-bin
    git
    htop
    lazygit
    home-manager
    just
    vesktop
    neovim
    ncdu
    nitch
    nil
    zed-editor
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
