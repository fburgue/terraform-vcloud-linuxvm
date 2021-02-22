let
  pkgs = import <nixpkgs> {};
  tf = pkgs.unstable.terraform_0_13.withPlugins (
    p: [
      pkgs.unstable.terraform-provider-vcd
      pkgs.unstable.terraform-provider-vault
    ]
  );

in
pkgs.stdenv.mkDerivation rec {
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
    gitAndTools.bump2version
    unstable.git-chglog
    terraform-docs
    tflint
    golint
    gocode
    shfmt
    shellcheck
    go
    golangci-lint
    gofumpt
    vault
  ];
}
