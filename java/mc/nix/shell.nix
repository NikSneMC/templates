{
  perSystem = {pkgs, ...}: {
    devShells.default = let
      jdk = pkgs.zulu8;

      packages = with pkgs; [
        jdk
      ];

      libraries = with pkgs; [
        libxkbcommon
        libiconv
        libGL

        stdenv.cc.cc.lib

        # WINIT_UNIX_BACKEND=wayland
        wayland

        # WINIT_UNIX_BACKEND=x11
        libxcursor
        libxrandr
        libxi
        libx11
      ];
    in
      with pkgs;
        mkShell {
          name = "java-mc";
          buildInputs = packages ++ libraries;

          DIRENV_LOG_FORMAT = "";
          LD_LIBRARY_PATH = "${lib.makeLibraryPath libraries}:$LD_LIBRARY_PATH";

          JAVA_HOME = "${jdk}";
        };
  };
}
