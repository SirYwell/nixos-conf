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
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.clion
  ];
}
