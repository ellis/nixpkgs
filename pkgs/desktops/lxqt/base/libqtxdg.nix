{ stdenv, fetchurl, pkgconfig }:

stdenv.mkDerivation rec {
  basename = "libqtxdg";
  version = "0.5.3";
  name = "${basename}-${version}";

  src = fetchurl {
    url = "http://lxqt.org/downloads/${basename}/${version}/${basename}-${version}.tar.gz";
    sha256 = "0q2spsa6g2a4nw22mgcmznw5kk0xqz64czd27vm5fry2z4nk5vy5";
  };
}
