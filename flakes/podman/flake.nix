{
  description = "Podman development environment with Docker compatibility";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin"; # Change if using a different architecture
      pkgs = import nixpkgs { inherit system; };

      # Provides a script that copies required files to ~/.config/
      podmanSetupScript =
        let
          registriesConf = pkgs.writeText "registries.conf" ''
            [registries.search]
            registries = ['docker.io']
            [registries.block]
            registries = []
          '';
        in
        pkgs.writeScript "podman-setup" ''
          #!${pkgs.runtimeShell}
          # Don't overwrite customised configuration
          if ! test -f ~/.config/containers/registries.conf; then
            install -Dm555 ${registriesConf} ~/.config/containers/registries.conf
          fi
        '';

      # Provides a fake "docker" binary mapping to podman
      dockerCompat = pkgs.runCommandNoCC "docker-podman-compat" { } ''
        mkdir -p $out/bin
        ln -s ${pkgs.podman}/bin/podman $out/bin/docker
      '';

    in
    {
      # Define a development shell
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          dockerCompat
          pkgs.podman
          pkgs.podman-compose
          pkgs.podman-desktop
        ];
        shellHook = ''
          # Install required configuration
          ${podmanSetupScript}
        '';
      };
    };
}
