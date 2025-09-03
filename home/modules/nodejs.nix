{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_22
    yarn
    pnpm
    nodePackages.typescript
    nodePackages.npm-check-updates
    nodePackages.eslint
  ];
}
