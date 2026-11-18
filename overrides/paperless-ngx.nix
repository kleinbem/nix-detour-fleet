# torch 2.15 is outside paperless-ngx's torch<2.15; the relax NixOS/nixpkgs#587638 adds.
# overrideAttrs, not overridePythonAttrs: the NixOS module calls the package's .override.
{ package, ... }:
package.overrideAttrs (old: {
  pythonRelaxDeps = old.pythonRelaxDeps or [ ] ++ [ "torch" ];
})
