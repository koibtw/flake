{ pkgs, ... }:
{
  system.activationScripts.quotas = {
    deps = [ ];
    text = ''
      echo
      ${pkgs.linuxquota}/bin/quotacheck -aumv || true
      ${pkgs.linuxquota}/bin/quotaon -auv || true
      for user in $(getent passwd | grep /var/ebil.club | cut -d: -f1); do
        echo "setting quota for $user"
        ${pkgs.linuxquota}/bin/setquota -u $user 8M 10M 0 0 / || true
      done
      echo
    '';
  };
}
