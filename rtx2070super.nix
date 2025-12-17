{ config, ... }:
{
  # temp: https://github.com/NixOS/nixpkgs/issues/467814
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  hardware.graphics.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = [ "nvidia" ];
}

