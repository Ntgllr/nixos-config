self: super: with super; {

  lowfi = let
    version = "1.5.5";
    pname = "lowfi";
  in stdenv.mkDerivation {
    name = "${pname}-${version}";

    src = pkgs.fetchurl {
        name = "lowfi";
        url = "https://github.com/talwat/lowfi/releases/download/${version}/lowfi-darwin-aarch64";
        sha256 = "sha256:dd9ebb27cac4f1fb6f10d69c5cc564366cd267601e2858e2a954c59b4450e537";
    };

    phases = [ "installPhase" ];

    installPhase = ''
        install -D $src $out/bin/lowfi
    '';

    meta = with lib; {
      homepage = "https://github.com/talwat/lowfi/";
      description = "Play low fidelity music from the command line";
      license = licenses.mit;
      maintainers = [ maintainers.talwat ];
    #   platforms = [ platforms.x86_64-linux platforms.x86_64-darwin ];
    };
  };
}