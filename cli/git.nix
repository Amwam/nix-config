{ pkgs, ... }:
{
  programs.git = {
    package = pkgs.git;
    enable = true;
    userEmail = "amit@amwam.me";
    userName = "Amit Shah";

    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIATayPewCYLpkcOma0QCtAsTbn5t3qb7WrXLtiZ0iwKE";
      gpg.format = "ssh";
      commit.gpgsign = true;
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };
  };
}
