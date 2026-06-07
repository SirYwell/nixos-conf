{
  config,
  pkgs,
  ...
}:
let 
  jetbrainsIde = ide: (pkgs.jetbrains."${ide}").override {
    forceWayland = true;
  };
in 
{
  environment.systemPackages = [
    (jetbrainsIde "idea")
    (jetbrainsIde "clion")
    pkgs.zed-editor-fhs
    pkgs.jabref

    pkgs.github-copilot-cli
    pkgs.lazygit
  ];
}

