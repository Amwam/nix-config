{ pkgs, lib, ... }:
let
  prettyLog = (pkgs.writeShellScript "pretty_git_log.sh" (builtins.readFile ./git/log.sh));
in
{

  programs.git = {
    package = pkgs.git;
    enable = true;
    userEmail = "amit@amwam.me";
    userName = "Amit Shah";

    ignores = (lib.splitString "\n" (builtins.readFile ./git/ignore.txt));

    extraConfig = {
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIATayPewCYLpkcOma0QCtAsTbn5t3qb7WrXLtiZ0iwKE";
      gpg.format = "ssh";
      commit.gpgsign = true;
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };

      push.default = "simple";
      pull.rebase = true;

      diff = {
        compactionHeuristic = true;
        colorMoved = true;
      };

      init.defaultBranch = "main";

      color = {
        ui = "auto";
        diff = true;
      };

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      alias = {
        st = "status -sb";
        co = "checkout";
        poc = "! git push -u origin $(git rev-parse --abbrev-ref HEAD)";
        pocf = "! git push -u origin $(git rev-parse --abbrev-ref HEAD) --force-with-lease";
        lg = "!. ${prettyLog} && pretty_git_log";
        lga = "!. ${prettyLog} && pretty_git_log --all";
      };
    };
  };

  programs.zsh.shellAliases = {
    g = "${pkgs.git}/bin/git";
    gst = "${pkgs.git}/bin/git st";
    glg = "${pkgs.git}/bin/git lg";
    glga = "${pkgs.git}/bin/git lga";
  };

}
