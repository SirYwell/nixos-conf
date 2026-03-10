{ config, lib, pkgs, ... }:
{
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;
}

