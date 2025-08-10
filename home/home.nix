{ pkgs, inputs, ... }: {

  imports = [
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/zen-browser.nix
  ];

  home.username = "blucin";
  home.homeDirectory = "/home/blucin";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    alacritty
    git
    htop
    home-manager
    firefox
    neovim
    nitch
    nitrogen
    zed-editor

    # File manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
  ];
}
