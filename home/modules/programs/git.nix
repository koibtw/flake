{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      signing.signByDefault = true;

      settings = {
        user = {
          name = "june";
          email = "me@koi.rip";
          signingkey = "5A530832DA9120B0CA57DDB67CBDB58ECF1D3478";
        };

        sendemail = {
          smtpuser = "me@koi.rip";
          smtpserver = "smtp.purelymail.com";
          smtpserverport = 465;
          smtpencryption = "ssl";
        };

        core = {
          compression = 9;
          whitespace = "error";
          preloadindex = true;
        };

        pull.rebase = true;
        interactive.singleKey = true;

        rebase = {
          autoStash = true;
          missingCommitsCheck = "warn";
        };

        status = {
          branch = true;
          showStash = true;
          showUntrackedFiles = "all";
        };

        log = {
          abbrevCommit = true;
        };

        diff = {
          context = 3;
          renames = "copies";
          interHunkContext = 10;
        };

        "color \"diff\"" = {
          commit = "blue";
          meta = "black bold";
          frag = "magenta";
          context = "white";
          whitespace = "yellow reverse";
          old = "red";
        };

        "color \"decorate\"" = {
          HEAD = "cyan reverse bold";
          branch = "green";
          tag = "yellow";
          remoteBranch = "magenta";
        };

        commit.template = toString ../../../external/gitmessage.txt;
        init.defaultBranch = "main";
      };
    };
    diff-so-fancy = {
      enable = true;
      enableGitIntegration = true;
      settings.markEmptyLines = false;
    };
  };
}
