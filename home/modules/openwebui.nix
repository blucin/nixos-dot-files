{ pkgs, lib, config, ... }:
let
  cfg = config.services.open-webui;
in
{
  options.services.open-webui = {
    enable = lib.mkEnableOption "Open WebUI (LLM Web interface)";

    package = lib.mkPackageOption pkgs "open-webui" { };

    host = lib.mkOption {
      type = lib.types.str;
      default = "127.0.0.1";
      description = "Host address to bind to";
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 8080;
      description = "Port to listen on";
    };

    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Open port in firewall";
    };

    environment = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {
        WEBUI_AUTH = "False";
        ANONYMIZED_TELEMETRY = "False";
        DATA_DIR = "${config.home.homeDirectory}/.local/share/open-webui";
      };
      description = "Environment variables for Open WebUI";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    home.packages = [ cfg.package ];

    systemd.user.services.open-webui = {
      Unit = {
        Description = "Open WebUI";
        Documentation = "https://docs.openwebui.com";
        After = [ "network.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${cfg.package}/bin/open-webui serve --host ${cfg.host} --port ${toString cfg.port}";
        Restart = "on-failure";
        RestartSec = 5;
        Environment = lib.mapAttrsToList (name: value: "${name}=${value}") cfg.environment;
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
