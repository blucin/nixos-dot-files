# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Networking
  networking.hostName = "camelot";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # Timezone
  time.timeZone = "Asia/Kolkata";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Services
  services = {
    xserver.enable = true;
    xserver.displayManager.lightdm.enable = true;
    xserver.windowManager.i3.enable = true;
    xserver.xkb.layout = "us";
    xserver.xkb.options = "eurosign:e,caps:escape";
    xserver.videoDrivers = [ "amdgpu" ];
    xserver.deviceSection = ''
      Option "TearFree" "true"
    '';
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    syncthing = {
      enable = true;
      openDefaultPorts = true;
    };
  };

  # Users
  users.users = {
    blucin = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      initialPassword = "changeme";
    };
  };

  # Packages
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    syncthing
    pavucontrol
    easyeffects
    libnotify
    fish
  ];
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.fish.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings.auto-optimise-store = true;

  system.stateVersion = "25.05";
}
