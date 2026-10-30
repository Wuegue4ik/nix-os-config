{ config, pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      share = true;
      ignoreDups = true;
      extended = true;
    };
    
    shellAliases = {
      ll = "ls -la";
      ls = "ls -A";

      ntr = "cd ~/Wuegue4ikNix && tree";
      nrs = "sudo nixos-rebuild switch --flake ~/Wuegue4ikNix --show-trace";
      gc = "sudo nix-collect-garbage -d";
      
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };
    
    initContent = ''
      setopt EXTENDED_HISTORY
      setopt HIST_EXPIRE_DUPS_FIRST
      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_SPACE
      setopt HIST_VERIFY
      setopt SHARE_HISTORY
      
      setopt AUTO_CD
      setopt AUTO_PUSHD
      setopt PUSHD_IGNORE_DUPS
      
      setopt COMPLETE_IN_WORD
      setopt ALWAYS_TO_END
      
      setopt EXTENDED_GLOB
      setopt NO_CASE_GLOB
      
      setopt PROMPT_SUBST
    '';
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "python"
        "pip"
        "sudo"
        "colored-man-pages"
        "history"
      ];
      theme = "bira";
    };
  };
}
