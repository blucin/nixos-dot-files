{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    rustc
    rust-analyzer
    cargo
    cargo-edit
    cargo-watch
    cargo-outdated
  ];

}
