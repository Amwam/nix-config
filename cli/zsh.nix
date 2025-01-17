{pkgs, ...}:
{

    programs.zsh = {

    enable = true;
    enableCompletion = true;
    sessionVariables = {
      SSH_AUTH_SOCK = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
      EDITOR = "vim";
    };
  };
}