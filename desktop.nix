{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  imports = [
    ./git-configuration.nix
    ./ides.nix
  ];

  environment.systemPackages = [
    pkgs.discord
    pkgsUnstable.jdk25
    pkgs.direnv
    pkgs.thunderbird

    pkgs.prismlauncher
  ];
}
