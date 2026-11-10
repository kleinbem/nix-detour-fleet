# The cargo setup hook now sets AWS_LC_SYS_USE_SYSTEM=1, so aws-lc-sys needs
# the system aws-lc; the build inputs NixOS/nixpkgs#584509 adds.
{ pkgs, package }:
package.overrideAttrs (old: {
  nativeBuildInputs = old.nativeBuildInputs or [ ] ++ [ pkgs.pkg-config ];
  buildInputs = old.buildInputs or [ ] ++ [ pkgs.aws-lc ];
})
