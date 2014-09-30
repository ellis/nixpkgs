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
          exec ${pkgs.lxqt.lxqt-common}/bin/startlxqt
        '';
      };

    environment.systemPackages = [
      pkgs.lxqt.compton-conf
      pkgs.lxqt.lximage-qt
      pkgs.lxqt.lxqt-about
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
      pkgs.lxqt.lxqt-config-randr
      pkgs.lxqt.lxmenu-data
      pkgs.lxqt.menu-cache
      pkgs.lxqt.pcmanfm-qt
    ];

    # Link some extra directories in /run/current-system/software/share
    environment.pathsToLink =
      [ "/share/lxqt" "/share/desktop-directories" ];

  };

}
