{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.hardware.new-lg4ff;
in {
  options.hardware.new-lg4ff = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enables improved Linux module drivers for Logitech driving wheels.
        This will replace the existing in-kernel hid-logitech modules.
        Works most notably on the Logitech G25, G27, G29 and Driving Force (GT).
      '';
    };
  };

  config = {
    boot = {
      extraModulePackages = [ pkgs.new-lg4ff ];
      kernelModules = [ "hid-logitech-new" ];
    };
  };

  meta.maintainers = with lib.maintainers; [ matthiasbenaets ];
}
