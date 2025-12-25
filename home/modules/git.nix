{
  programs.git.settings = {
    enable = true;
    userName = "blucin";
    userEmail = "blucin@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
