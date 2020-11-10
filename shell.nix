let
  basepkgs = import <nixpkgs> { };
  overlay = builtins.fetchTarball
    "http://stash.cirb.lan/CICD/nixpkgs-overlays/archive/20.09.tar.gz";
  src = basepkgs.fetchFromGitHub {  # This is head of release 20.09 branch
    rev = "f7fe019d53e63b7f29d415496d696c003dfcfffb";
    sha256 = "006cxpn6f1vgjq5y4jmpw4p0vc179shz7ivz7lhyxi4wyxab2r8d";
    owner = "NixOS";
    repo = "nixpkgs";
  };
  pkgs = import src { overlays = [ (import "${overlay}/overlays.nix") ]; };
  tf = pkgs.unstable.terraform_0_13.withPlugins (p: [
    pkgs.terraform-provider-vcd
  ]);

in pkgs.stdenv.mkDerivation rec {
  name = "tf-vcloud";
  env = pkgs.buildEnv {
    name = name;
    paths = buildInputs;
  };

  buildInputs = with pkgs;[
    tf
    jq
    zsh
    gitAndTools.pre-commit
    terraform-docs
    cacert
    tflint
    golint
    gocode
    shfmt
    shellcheck
  ];
}
