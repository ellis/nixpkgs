{ stdenv, fetchgit, pkgconfig
, cmake
, qt48Full

# lxqt dependencies
, libqtxdg
}:

stdenv.mkDerivation rec {
  basename = "liblxqt";
  version = "0.7.0";
  name = "${basename}-${version}";

  src = fetchgit {
    url = "https://github.com/lxde/${basename}.git";
    rev = "948bc69d2e574bf0243bb79d84f366426e833ecc";
    sha256 = "53f206078da0eec56f1b5505c7e1ec33ba2bd71015d5aea58b7429678f1d25c6";
  };

  buildInputs = [ stdenv cmake qt48Full libqtxdg ];
}
