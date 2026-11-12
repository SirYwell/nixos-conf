{ lib, pkgs, ... }:

let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  plugins = [ "1password" "git" "sudo" ];
  theme = "agnoster";
in
{
  environment.systemPackages = [ pkgs.fzf ] ++ lib.optional isDarwin pkgs.oh-my-zsh;

  programs.zsh = lib.mkMerge [ {
    enable = true;
    enableCompletion = true;
    interactiveShellInit = lib.mkAfter ''
      eval "$(${lib.getExe pkgs.fzf} --zsh)"
    '';
  } (if isDarwin then {
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableGlobalCompInit = false;
    promptInit = "";
    interactiveShellInit = lib.mkBefore ''
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
      mkdir -p "$ZSH_CACHE_DIR"
      plugins=(${lib.concatStringsSep " " plugins})
      ZSH_THEME="${theme}"
      source "$ZSH/oh-my-zsh.sh"
    '';
  } else {
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      inherit plugins theme;
    };
  }) ];
}
