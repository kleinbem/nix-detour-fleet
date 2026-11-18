# torch 2.15 is outside paperless-ngx's torch<2.15; the relax NixOS/nixpkgs#587638 adds.
{ package, ... }:
package.overridePythonAttrs (old: {
  pythonRelaxDeps = old.pythonRelaxDeps or [ ] ++ [ "torch" ];
})
