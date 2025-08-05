{ config, pkgs, ... }: let
  desktop = config.custom.desktop;  # Set this in host config, e.g., "i3" or "gnome"
in {
  config = lib.mkIf (desktop == "i3") {
    services.xserver.windowManager.i3.enable = true;
  } // lib.mkIf (desktop == "gnome") {
    services.xserver.desktopManager.gnome.enable = true;
  };
}

