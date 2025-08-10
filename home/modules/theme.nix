{ pkgs, ... }:
{
  # GTK Theme
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "Fluent";
      package = pkgs.fluent-icon-theme;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  # QT Theme TODO

  # Fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    fluent-gtk-theme
    nerd-fonts.jetbrains-mono
    icomoon-feather
  ];
}
