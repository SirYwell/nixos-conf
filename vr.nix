{
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.openxr-loader
  ];

  programs.steam = {
    enable = true;
  };

  hardware.steam-hardware.enable = true;
}


