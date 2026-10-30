{ config, pkgs, ... }:
{

  imports = [
    ./modules
  ];

  home = {
    username = "wuegue4ik";
    homeDirectory = "/home/wuegue4ik";
    stateVersion = "26.05";
  };

}
