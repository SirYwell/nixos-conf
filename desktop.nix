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

  programs.ssh = {
    extraConfig = "
      Host *
        IdentityAgent ~/.1password/agent.sock

      Host orakel
        Hostname orakel.sirywell.de
	Port 22
	User ubuntu
	IdentityFile ~/.ssh/orakel.pub
	IdentitiesOnly yes
      ";
  };

  boot.kernel.sysctl."kernel.sysrq" = 1;
}
