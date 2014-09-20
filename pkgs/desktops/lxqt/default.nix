{ pkgs, newScope }: let

callPackage = newScope (deps // lxqt_self);

deps = rec { # lxqt-global dependency overrides should be here
  inherit (pkgs.gnome) libglade libwnck vte gtksourceview;
  inherit (pkgs.perlPackages) URI;
};

lxqt_self = rec { # the lines are very long but it seems better than the even-odd line approach

  #### NixOS support

  #inherit (pkgs) gvfs;
  #xinitrc = "${lxqtsession}/etc/xdg/lxqt/xinitrc";

  libqtxdg = callPackage ./base/libqtxdg.nix { };
}; # lxqt_self

in lxqt_self
