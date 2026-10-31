{ pkgs, pkgs-unstable, ... }:
{
  disabledModules = ["programs/throne.nix"];
  imports = [
    "${pkgs-unstable}/nixos/modules/programs/throne.nix"
  ];

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
      package = pkgs-unstable.throne;
      tunMode.enable = true;
    };
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}