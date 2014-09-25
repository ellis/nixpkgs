{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.services.xserver.desktopManager.lxqt;

in

{
  options = {

    services.xserver.desktopManager.lxqt.enable = mkOption {
      default = false;
      example = false;
      description = "Enable the lxqt desktop manager.";
    };

  };

  config = mkIf (config.services.xserver.enable && cfg.enable) {

    services.xserver.desktopManager.session = singleton
      { name = "lxqt";
        start = ''
          test -r "$HOME/.Xmodmap" && xmodmap "$HOME/.Xmodmap"
          exec ${pkgs.lxqt.lxqt-common}/bin/startlxqt
          #exec ${pkgs.haskellPackages.xmonad}/bin/xmonad
          #waitPID=$!
        '';
      };

    environment.systemPackages = [
      pkgs.lxqt.lximage-qt
      pkgs.lxqt.lxqt-globalkeys
      pkgs.lxqt.lxqt-notificationd
      pkgs.lxqt.lxqt-openssh-askpass
      pkgs.lxqt.lxqt-panel
      pkgs.lxqt.lxqt-policykit
      pkgs.lxqt.lxqt-powermanagement
      pkgs.lxqt.lxqt-qtplugin
      pkgs.lxqt.lxqt-runner
      pkgs.lxqt.lxqt-session
      pkgs.lxqt.lxqt-common
      pkgs.lxqt.lxqt-config
      pkgs.lxqt.lxmenu-data
      pkgs.lxqt.menu-cache
      pkgs.lxqt.pcmanfm-qt
    ];

  };

}
