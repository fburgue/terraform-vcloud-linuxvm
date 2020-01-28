{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  tf = unstable.terraform.withPlugins (p: [
    terraform-provider-vcd
  ]);

in pkgs.stdenv.mkDerivation rec {
  name = "tf-vcloud";
  env = pkgs.buildEnv {
    name = name;
    paths = buildInputs;
  };

  buildInputs = [
    tf
    pkgs.jq
    pkgs.zsh
    pkgs.gitAndTools.pre-commit
    pkgs.terraform-docs
    pkgs.cacert
    pkgs.tflint
    pkgs.golint
    pkgs.gocode
  ];
}
