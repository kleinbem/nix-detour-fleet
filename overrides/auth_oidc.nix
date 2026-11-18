# Home Assistant 2026.11 keeps person data in a PersonData object, not a tuple;
# the test fix from NixOS/nixpkgs#587567.
{ package, ... }:
package.overrideAttrs (old: {
  postPatch = old.postPatch or "" + ''
    substituteInPlace tests/test_hass_auth_provider.py \
      --replace-fail "hass.data[PERSON_DOMAIN][1]" "hass.data[PERSON_DOMAIN].storage_collection"
  '';
})
