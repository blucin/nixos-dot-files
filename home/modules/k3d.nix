{ pkgs, ... }:

{
  home.packages = with pkgs; [
    k3d
    kubectl
  ];

  programs.fish.shellAliases = {
    k = "kubectl";
    kctx = "kubectl config use-context";
  };
}
