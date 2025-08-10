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
      name = "OpenSans-Regular";
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

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    dconf
    fluent-gtk-theme
    fluent-icon-theme
    open-sans
    nerd-fonts.jetbrains-mono
    icomoon-feather
  ];
}
