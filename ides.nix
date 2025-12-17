{
  config,
  pkgsUnstable,
  ...
}:
let 
  jetbrains-plugins = [ "github-copilot--your-ai-pair-programmer" ];
  jetbrains-ide = ide: pkgsUnstable.jetbrains.plugins.addPlugins (pkgsUnstable.jetbrains."${ide}".override {
    forceWayland = true;
  }) jetbrains-plugins;
in 
{
  environment.systemPackages = [
    (jetbrains-ide "idea-ultimate")
    (jetbrains-ide "clion")
  ];
}

