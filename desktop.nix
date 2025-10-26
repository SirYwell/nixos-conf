{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./git-configuration.nix
  ];

  environment.systemPackages = [
    pkgs.discord
  ];
}
