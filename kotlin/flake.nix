{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      mkshell =
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.android_sdk.accept_license = true;
          };
          in
          {
            ${system}.default =
              pkgs.buildFHSUserEnv
		{
                  name = "kotlin-sdk-env";
                  targetPkgs =
                    pkgs:
                  (with pkgs; [
                    gradle
                    jdk
                    kotlin

                    kotlin-language-server
                    ktlint
                    ktfmt
                  ]);
                runScript = "bash";
              }
              .env;
        };
      in
      {
	devShells = nixpkgs.lib.foldr nixpkgs.lib.mergeAttrs { } (map mkshell supportedSystems);
      };
}
