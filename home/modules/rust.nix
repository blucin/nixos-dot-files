{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    cargo
    rust-analyzer
    cargo-edit
    cargo-watch
    cargo-outdated
    clippy
    rustfmt
  ];

}
