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
          ${pkgs.lxqt.lxqt-panel}/bin/lxqt-panel &
          exec ${pkgs.haskellPackages.xmonad}/bin/xmonad
          #waitPID=$!
        '';
      };

    environment.systemPackages = [
      pkgs.haskellPackages.xmonad
      #pkgs.lxqt.lxqt-globalkeys
      #pkgs.lxqt.lxqt-notificationd
      pkgs.lxqt.lxqt-panel
      #pkgs.lxqt.lxqt-policykit
      #pkgs.lxqt.lxqt-qtplugin
      #pkgs.lxqt.lxqt-runner
      #pkgs.lxqt.lxqt-session
      #pkgs.lxqt.lxmenu-data
      #pkgs.lxqt.menu-cache
      #pkgs.lxqt.pcmanfm-qt
    ];

  };

}
