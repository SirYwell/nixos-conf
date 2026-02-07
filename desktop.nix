{
  config,
  pkgs,
  pkgsUnstable,
  boot,
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
  programs.direnv.enable = true;

  boot.kernel.sysctl."kernel.sysrq" = 1;
}
