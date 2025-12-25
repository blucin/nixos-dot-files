{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Fluent-Dark-compact";
      package = pkgs.fluent-gtk-theme;
    };
    iconTheme = {
      name = "Fluent-dark";
      package = pkgs.fluent-icon-theme;
    };
    font = {
      name = "Inter";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };

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
    dconf
    fluent-gtk-theme
    fluent-icon-theme
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
