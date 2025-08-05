{ pkgs, ... }: {
  home.username = "alice";
  home.homeDirectory = "/home/alice";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [ htop git ];

  programs.git = {
    enable = true;
    userName = "blucin";
    userEmail = "blucin@users.noreply.github.com";  # No-reply email
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.fish.enable = true;

  # Import modules from home/modules/ for reusability, e.g., imports = [ ./modules/example.nix ];
}

