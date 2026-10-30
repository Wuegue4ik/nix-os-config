{ pkgs, ... }:
{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
  
    ensureDatabases = [ "wuegue4ik" ];
    ensureUsers = [
      {
        name = "wuegue4ik";
        ensureDBOwnership = true;
        
      }
    ];
    initialScript = pkgs.writeText "init-pg-script" ''
      ALTER USER wuegue4ik WITH SUPERUSER PASSWORD 'wuegue4ik';
    '';

    authentication = pkgs.lib.mkOverride 10 ''
      local   all   all                 trust
      host    all   all   127.0.0.1/32  scram-sha-256
      host    all   all   ::1/128       scram-sha-256
    '';
  };
}
