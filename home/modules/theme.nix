{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Noto Serif"
        "DejaVu Serif"
      ];
      sansSerif = [
        "Inter"
        "Noto Sans"
        "DejaVu Sans"
      ];
      monospace = [
        "JetBrainsMono Nerd Font Mono"
        "DejaVu Sans Mono"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  home.packages = with pkgs; [
    # Fonts for better rendering
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    dejavu_fonts
    # Monospace fonts
    nerd-fonts.jetbrains-mono
    # Icon fonts for rofi power menu
    icomoon-feather
    font-awesome
  ];
}
