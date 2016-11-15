{config, pkgs, ...}:
{

  environment.systemPackages = with pkgs; [
     gitAndTools.gitFull git-cola gnupg gnupg1compat
     zip unzip file gparted exfat
     gcc gnumake nasm autoconf automake zlib dpkg
     curl wget chromium firefox torbrowser
    boot leiningen
     nodejs phantomjs electron
     gparted
     idea.idea-community jdk clojure idea.webstorm
     zsh python python3 pypy bash terminator
     skype vlc
     gimp goldendict optipng vagrant
     audacity lame
  ];


  nixpkgs.config = {

    allowUnfree = true;

    firefox = {
     enableGoogleTalkPlugin = true;
     enableAdobeFlash = true;
    };

    chromium = {
     enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
     enablePepperPDF = true;
     enableWideVine = true;
    };
  };

  virtualisation.virtualbox.host.enable = true;
  nixpkgs.config.virtualbox.enableExtensionPack = true;
  
  services.mongodb.enable = true; 
}
