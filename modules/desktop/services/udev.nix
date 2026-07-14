{ pkgs, ... }:
{
  services.udev = {
    packages = [ pkgs.qmk-udev-rules ];
    extraRules = ''
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="02a0", MODE="0660", TAG+="uaccess"
      ATTRS{name}=="*DualSense*Touchpad*", ENV{ID_INPUT_TOUCHPAD}=""
    '';
  };
}
