{ config, pkgs, lib, ...  }:
{

  imports = [
    ./packages.nix
    ./nvim.nix
    ./zsh.nix
    ./git.nix
  ];

}
