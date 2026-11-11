# The cargo setup hook now links aws-lc, oniguruma, sqlite and zstd from the
# system; the build inputs NixOS/nixpkgs#585196 adds.
{ pkgs, package }:
package.overrideAttrs (old: {
  buildInputs = old.buildInputs or [ ] ++ [
    pkgs.aws-lc
    pkgs.oniguruma
    pkgs.sqlite
    pkgs.zstd
  ];
})
