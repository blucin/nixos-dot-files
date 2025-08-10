{ pkgs, inputs, ... }: {

  imports = [
    ./modules/i3
    ./modules/polybar
    ./modules/rofi
    ./modules/starship
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/zen-browser.nix
    ./modules/theme.nix
  ];

  home.packages = with pkgs; [
    alacritty
    copyq
    polybarFull
    dunst
    git
    htop
    home-manager
    vesktop
    neovim
    nitch
    nitrogen
    zed-editor
    starship

    # File manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xarchiver
  ];

  home.username = "blucin";
  home.homeDirectory = "/home/blucin";
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
