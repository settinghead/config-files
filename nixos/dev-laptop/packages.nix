{config, pkgs, ...}:
{

  environment.systemPackages = with pkgs; [
     gitAndTools.gitFull git-cola tig gnupg gnupg1compat
     zip unzip file google-drive-ocamlfuse
     gcc gnumake nasm autoconf automake zlib
     curl wget chromium firefox torbrowser google-chrome firefoxWrapper
    boot leiningen
     nodejs phantomjs
     fcitx fcitx-configtool
     atom idea.idea-community jdk clojure
     zsh python python3 pypy bash terminator
     skype vlc
     wine winetricks
     gimp goldendict optipng vagrant
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
}
