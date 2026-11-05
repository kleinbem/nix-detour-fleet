# The node_modules hash nixpkgs has for 2.2.5 never matched on Linux;
# this is the one NixOS/nixpkgs#582675 sets.
{ package, ... }:
package.overrideAttrs (old: {
  node_modules = old.node_modules.overrideAttrs {
    outputHash = "sha256-prx9dX7kUvs/E3zopkaPk5LXh3xJAy5sZeum/W8L7cA=";
  };
})
