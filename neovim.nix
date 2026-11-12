{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.wrapNeovim pkgs.neovim-unwrapped {
      configure.customRC = ''
        set number
      '';
    })
  ];
  environment.pathsToLink = [ "/share/nvim" ];
}
