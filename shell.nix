let
  pkgs = import <nixpkgs> { };
  tf = pkgs.terraform_0_13.withPlugins
    (
      p: with pkgs; [
        terraform-provider-vcd_v3x
        terraform-provider-vault
      ]
    );
in
pkgs.mkShell {
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
