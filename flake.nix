{
  description = "Amit's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:Amwam/nix-darwin-f/title-bar-double-click";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      mac-app-util,
      ...
    }:
    let
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          # Allow installing licenced software
          nixpkgs.config.allowUnfree = true;

          users.users.amit = {
            name = "amit";
            home = "/Users/amit";
          };

          system = {
            defaults = {

              loginwindow.LoginwindowText = "Hi Amit!";

              NSGlobalDomain = {
                _HIHideMenuBar = true;
                AppleActionOnDoubleClick = "Minimize";
              };

              trackpad = {
                TrackpadThreeFingerDrag = true;
              };
            };

          };


          security = {
            pam = {
              # Enable Touch ID for Sudo
              enableSudoTouchIdAuth = true;
            };
          };

        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#macmini
      darwinConfigurations."macmini" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amit = import ./home.nix;
            home-manager.sharedModules = [
              mac-app-util.homeManagerModules.default
              (
                { pkgs, ... }:
                {
                  home = {

                    homeDirectory = "/Users/amit";
                    # This is where you would install any programs as usual:
                    packages = with pkgs; [
                      # What mac-app-util does for you, is that you can also just
                      # install derivations here which have a `/Applications/`
                      # directory, and it will be available in Spotlight and in your App
                      # Launcher, no further configuration needed:

                      iterm2
                    ];
                  };
                }
              )
            ];

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
          ./vscode.nix
          ./cli/iterm2.nix
        ];
      };
    };
}
