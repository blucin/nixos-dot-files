{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    # ../../modules/desktop.nix  # Uncomment for multi-desktop support
  ];

  # For desktop selection (uncomment import above and set this)
  # custom.desktop = "i3";  # Or "gnome", etc.

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        devices = [ "nodev" ];
        useOSProber = true;
      };
      efi.efiSysMountPoint = "/boot/efi";
    };
    kernelPackages = pkgs.linuxPackages_zen;
  };

  networking = {
    hostName = "sandcastle";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  fonts.packages = with pkgs; [ dejavu_fonts noto-fonts font-awesome ];

  services = {
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      displayManager.lightdm.enable = true;
      videoDrivers = [ "qxl" ];
      xkb = {
        layout = "us";
        options = "eurosign:e,caps:escape";
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    openssh.enable = true;
  };

  hardware.enableAllFirmware = true;

  # Users defined per host (add more as needed)
  users.users = {
    alice = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      initialPassword = "changeme";
      packages = with pkgs; [ tree ];
    };
    # Example additional user: bob = { isNormalUser = true; ... };
  };

  environment.systemPackages = with pkgs; [
    vim wget neovim git alacritty firefox spice-vdagent spice xclip
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  system = {
    stateVersion = "25.05";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

