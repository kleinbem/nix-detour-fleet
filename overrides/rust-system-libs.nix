# The cargo setup hook now links aws-lc, openssl, sqlite and zstd from the
# system (AWS_LC_SYS_USE_SYSTEM, LIBSQLITE3_SYS_USE_PKG_CONFIG, ...;
# NixOS/nixpkgs#570938), so a package with those -sys crates needs them as
# build inputs. Extra ones a package doesn't use are harmless.
{ pkgs, package }:
package.overrideAttrs (old: {
  nativeBuildInputs = old.nativeBuildInputs or [ ] ++ [ pkgs.pkg-config ];
  buildInputs = old.buildInputs or [ ] ++ [
    pkgs.aws-lc
    pkgs.openssl
    pkgs.sqlite
    pkgs.zstd
  ];
})
