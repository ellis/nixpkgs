{ stdenv, fetchgit, pkgconfig
, cmake
, file # libmagic.so
, linuxHeaders # magic.h
, qt5
}:

stdenv.mkDerivation rec {
  basename = "libqtxdg";
  version = "0.5.3";
  name = "${basename}-${version}";

  src = fetchgit {
    url = "https://github.com/lxde/libqtxdg.git";
    rev = "8199feb8b8484147eff2ea622f0a6169208766ea";
    sha256 = "4291e837d072b7c2b7737b6ef897bb85e38d5d1102ad1a6c195ca71245f21490";
    #url = "http://lxqt.org/downloads/${basename}/${version}/${basename}-${version}.tar.gz";
    #sha256 = "0q2spsa6g2a4nw22mgcmznw5kk0xqz64czd27vm5fry2z4nk5vy5";
  };

  buildInputs = [ stdenv cmake qt5 file ];

  cmakeFlags = [ "-DUSE_QT5=ON -DKRNINC=${linuxHeaders}/include/linux" ];
}
