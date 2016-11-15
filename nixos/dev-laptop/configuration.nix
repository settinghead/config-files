# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./packages.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";
  boot.loader.timeout = 1;
  networking.hostName = "settinghead-nix"; # Define your hostname.
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
  # for chromecast
  networking.firewall.allowedUDPPortRanges = [{ from = 32768; to =
61000; }];
  networking.firewall.allowedTCPPorts = [80 3000 8000 8080 8008 ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
#networking.extraHosts =
#  ''
#    103.245.222.162 registry.npmjs.com
#    192.30.253.112 github.com
#  '';

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
  # services.xserver.desktopManager.gnome3.enable = true;
  # services.xserver.desktopManager.kde5.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  programs.zsh.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.ubuntu = {
     isNormalUser = true;
     uid = 1000;
     extraGroups=["wheel" "networkmanager" "vboxusers" "audio" "disk" "video"
"docker"];
     shell = "/run/current-system/sw/bin/zsh";
  };
  services.xserver.displayManager.auto.enable = true;
  services.xserver.displayManager.auto.user = "ubuntu";

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

  hardware = {
    pulseaudio.enable = true;
    pulseaudio.support32Bit = true; # This might be needed for Steam games
    pulseaudio.package = pkgs.pulseaudioFull;
  };

  services.nixosManual.showManual = true;

  services.xserver.libinput = {
    enable = true;
  };

  services.redshift = {
    enable = true;
    latitude = "43.65";
    longitude = "-79.38";
  };

  services.unclutter.enable = true;


}
