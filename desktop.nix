{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  imports = [
    ./git-configuration.nix
  ];

  environment.systemPackages = [
    pkgs.discord
    pkgsUnstable.jetbrains.idea-ultimate
    pkgsUnstable.jetbrains.clion
  ];
}
