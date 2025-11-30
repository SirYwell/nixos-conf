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
    (pkgsUnstable.jetbrains.idea-ultimate.override {
      vmopts = "-Dawt.toolkit.name=WLToolkit";
    })
    (pkgsUnstable.jetbrains.clion.override {
      vmopts = "-Dawt.toolkit.name=WLToolkit";
    })
    pkgsUnstable.jdk25
    pkgs.direnv

    pkgs.prismlauncher
  ];
}
