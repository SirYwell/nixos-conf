{
  config,
  pkgsUnstable,
  ...
}:
let 
  jetbrainsIde = ide: (pkgsUnstable.jetbrains."${ide}").override {
    forceWayland = true;
  };
in 
{
  environment.systemPackages = [
    (jetbrainsIde "idea")
    (jetbrainsIde "clion")
    pkgsUnstable.zed-editor-fhs
    pkgsUnstable.jabref

    pkgsUnstable.github-copilot-cli
  ];
}

