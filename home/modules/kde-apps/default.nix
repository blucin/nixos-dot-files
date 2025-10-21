{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.okular
    kdePackages.gwenview
    kdePackages.spectacle
    kdePackages.kcalc
  ];
}
