{ config, pkgs, ... }:
{

  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "Wuegue4ik";
        email = "grigvladik@gmail.com";
      };

      core = {
        editor = "nvim";
        autocrlf = "input";
        precomposeunicode = true;
      };

      init = {
        defaultBranch = "main";
      };
    };
  };
  
  programs.gh.enable = true;

}