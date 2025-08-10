{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dconf
    fluent-gtk-theme
    fluent-icon-theme
    nerd-fonts.jetbrains-mono
    icomoon-feather
  ];
}
