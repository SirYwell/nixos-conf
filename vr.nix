{
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.openxr-loader
    pkgs.wayvr
  ];

  environment.sessionVariables = {
    STEAMVR_RUNTIME = "1";
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };
}

