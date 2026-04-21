{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jdk25
  ];

  # Set Java 25 as the default for user environment
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.jdk25}";
  };
}
