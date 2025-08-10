{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  programs.zen-browser = {
    enable = true;
    profiles = {
      default = {
        # bookmarks, extensions, search engines ...
      };
    };
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
