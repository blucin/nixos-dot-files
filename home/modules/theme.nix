{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
  stylix.targets.zen-browser.profileNames = [ "bmx67la8.Default (release)" ];
  stylix.image = ../../assets/mountain.jpg;
  stylix.polarity = "dark";
  home.packages = with pkgs; [
    dconf
    fluent-gtk-theme
    fluent-icon-theme
    nerd-fonts.jetbrains-mono
    icomoon-feather
  ];
}
