{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    config = [
      { 
        user.name = "SirYwell"; 
	user.email = "hannesgreule@outlook.de";
	user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIChk1xYDtrWUlqnrVR73TIGR0c0epi1yXiap3ti9joC8";
      }
      {
        commit.gpgSign = true;
	gpg.format = "ssh";
	gpg.ssh.program = "/run/current-system/sw/bin/op-ssh-sign";
      }
    ];
  };
}
