{ pkgs, ... }:
{

  hardware.opentabletdriver.enable = true;

  services.flatpak.enable = true;

  programs = {
    steam = {
      enable = true;
      package = pkgs.steam;
    };
    gamescope.enable = true;
    throne = {
      enable = true;
      tunMode.enable = true;
    };
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}