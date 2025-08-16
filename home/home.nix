{ pkgs, inputs, ... }: {

  imports = [
    ./modules/i3
    ./modules/dunst
    ./modules/polybar
    ./modules/fish
    ./modules/rofi
    ./modules/alacritty
    ./modules/starship
    ./modules/git.nix
    ./modules/zen-browser.nix
    ./modules/theme.nix
  ];

  home.username = "blucin";
  home.homeDirectory = "/home/blucin";

  home.packages = with pkgs; [
    alacritty
    btop
    copyq
    easyeffects
    polybarFull
    dunst
    git
    htop
    lazygit
    home-manager
    just
    vesktop
    neovim
    ncdu
    nitch
    nitrogen
    zed-editor
    rofi
    ksnip
    starship
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xarchiver
  ];

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
