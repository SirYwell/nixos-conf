{
  config,
  pkgs,
  ...
}:
let
  jetbrainsJdkPatched = pkgs.stdenv.mkDerivation rec {
    pname = "jetbrains-jdk-bin";
    version = "25.0.3-linux-x64-b329.124";

    src = pkgs.fetchurl {
      url = "https://cache-redirector.jetbrains.com/intellij-jbr/jbr_jcef-${version}.tar.gz";
      hash = "sha256-0qUPSN+zV39BTp/A7OgOIEhs6hewqZwXxZUXXzE053U=";
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    buildInputs = with pkgs; [
      alsa-lib
      atk
      at-spi2-atk
      cairo
      cups
      dbus
      fontconfig
      freetype
      glib
      libdrm
      libglvnd
      libx11
      libXcomposite
      libXcursor
      libXdamage
      libxext
      libXfixes
      libXrandr
      libxkbcommon
      libxrender
      libxtst
      mesa
      nspr
      nss
      pango
      wayland
      zlib
    ];

    runtimeDependencies = with pkgs; [
      udev
    ];

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      mkdir -p $out
      cp -r ./* $out/
    '';

    passthru.home = "${jetbrainsJdkPatched}";
  };

  jetbrainsIde =
    ide:
    let
      base = (pkgs.jetbrains."${ide}").override {
        forceWayland = true;
        jdk = jetbrainsJdkPatched;
      };
    in
    pkgs.symlinkJoin {
      name = "${ide}-jbr-patched";
      paths = [ base ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram "$out/bin/${ide}" \
          --set FONTCONFIG_FILE /etc/fonts/fonts.conf \
          --set FONTCONFIG_PATH /etc/fonts \
          --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [
            pkgs.fontconfig
            pkgs.freetype
          ]}"
      '';
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
