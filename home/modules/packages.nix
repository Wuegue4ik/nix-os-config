{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    telegram-desktop
    vscode
    btop
    firefox
    krita
    libreoffice
    android-studio
    qbittorrent
    reaper
    yabridgectl
    yabridge
    wine
    devenv
    prismlauncher
    vesktop
    obs-studio
    tree
    gtk3
    docker-compose
    blender
    anki
  ];

}
