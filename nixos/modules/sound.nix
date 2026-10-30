{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    wireplumber.extraConfig = {
      "10-disable-headset-autoswitch" = {
        "wireplumber.settings" = {
          "bluetooth.autoswitch-to-headset-profile" = true;
        };
      };
    };
  };
}