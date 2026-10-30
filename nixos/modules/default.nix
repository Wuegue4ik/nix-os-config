{ config, pkgs, lib, ...  }:
{

  imports = [
    ./fonts.nix
    ./postgresql.nix
    ./soft.nix
    ./sound.nix
  ];

}
