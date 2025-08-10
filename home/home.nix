{ pkgs, inputs, ... }: {

  imports = [
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/zen-browser.nix
    ./modules/theme.nix
  ];

  home.packages = with pkgs; [
    alacritty
    git
    htop
    home-manager
    vesktop
    neovim
    nitch
    nitrogen
    zed-editor

    # File manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
  ];

  home.username = "blucin";
  home.homeDirectory = "/home/blucin";
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "25.05";
}
