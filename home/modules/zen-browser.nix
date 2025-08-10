{ inputs, ... }:
{
  programs.zen-browser = {
    enable = true;
    policies = {
      Preferences = {
        "browser.compactmode.show" = {
          "Value" = true;
          "Status" = "locked";
        };
      };
    };
  };
}
