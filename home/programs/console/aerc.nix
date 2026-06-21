{ config, ... }:
{
  age.secrets = {
    email-pass-me.file = ../../../secrets/email-pass-me.age;
    email-pass-noreply.file = ../../../secrets/email-pass-noreply.age;
  };

  evergarden.aerc.enable = true;

  programs.aerc = {
    enable = true;
    extraConfig = {
      general = {
        pgp-provider = "gpg";
        use-terminal-pinentry = true;
        unsafe-accounts-conf = true;
      };
      viewer.pager = "less --tilde -c";
      filters = {
        "text/plain" = "colorize";
        "text/html" = "html | colorize";
        ".headers" = "colorize";
        "message/delivery-status" = "colorize";
      };
      ui.threading-enabled = true;
    };
    extraAccounts = {
      june = {
        from = "june <me@koi.rip>";
        copy-to = "Sent";
        cache-headers = true;
        pgp-auto-sign = true;
        pgp-self-encrypt = true;
        pgp-key-id = "00F61623FB56BC5BB7094E634CE6C1172DF6BE79";
        source = "imaps://me%40koi.rip@imap.purelymail.com:993";
        outgoing = "smtps://me%40koi.rip@smtp.purelymail.com:465";
        source-cred-cmd = "cat ${config.age.secrets.email-pass-me.path}";
        outgoing-cred-cmd = "cat ${config.age.secrets.email-pass-me.path}";
      };
      noreply = {
        from = "noreply@koi.rip";
        cache-headers = true;
        source = "imaps://noreply%40koi.rip@imap.purelymail.com:993";
        outgoing = "smtps://noreply%40koi.rip@smtp.purelymail.com:465";
        source-cred-cmd = "cat ${config.age.secrets.email-pass-noreply.path}";
        outgoing-cred-cmd = "cat ${config.age.secrets.email-pass-noreply.path}";
      };
    };
    extraBinds = {
      messages = {
        q = ":prompt 'quit?' quit<Enter>";
        e = ":next<Enter>";
        i = ":prev<Enter>";
        "<Down>" = ":next<Enter>";
        "<Up>" = ":prev<Enter>";
        "<PgDn>" = ":next 100%<Enter>";
        "<PgUp>" = ":prev 100%<Enter>";
        N = ":collapse-folder<Enter>";
        E = ":next-folder<Enter>";
        I = ":prev-folder<Enter>";
        O = ":expand-folder<Enter>";
        "<C-Left>" = ":collapse-folder<Enter>";
        "<C-Down>" = ":next-folder<Enter>";
        "<C-Up>" = ":prev-folder<Enter>";
        "<C-Right>" = ":expand-folder<Enter>";
        k = ":next-result<Enter>";
        K = ":prev-result<Enter>";
        g = ":select 0<Enter>";
        G = ":select -1<Enter>";
        v = ":mark -t<Enter>";
        V = ":mark -v<Enter>";
        "<Space>" = ":mark -t<Enter>:next<Enter>";
        T = ":toggle-threads<Enter>";
        zc = ":fold<Enter>";
        zo = ":unfold<Enter>";
        za = ":fold -t<Enter>";
        zM = ":fold -a<Enter>";
        zR = ":unfold -a<Enter>";
        "<Tab>" = ":fold -t<Enter>";
        zz = ":align center<Enter>";
        zt = ":align top<Enter>";
        zb = ":align bottom<Enter>";
        "<Enter>" = ":view<Enter>";
        d = ":choose -o y 'delete' delete-message<Enter>";
        D = ":delete<Enter>";
        a = ":archive flat<Enter>";
        A = ":unmark -a<Enter>:mark -T<Enter>:archive flat<Enter>";
        C = ":compose<Enter>";
        m = ":compose<Enter>";
        b = ":bounce<space>";
        rr = ":reply -a<Enter>";
        rq = ":reply -aq<Enter>";
        Rr = ":reply<Enter>";
        Rq = ":reply -q<Enter>";
        c = ":cf<space>";
        "|" = ":pipe<space>";
        "/" = ":search<space>";
        "\\" = ":filter<space>";
        "<Esc>" = ":clear<Enter>";
        s = ":split<Enter>";
        S = ":vsplit<Enter>";
        pl = ":patch list<Enter>";
        pa = ":patch apply <Tab>";
        pd = ":patch drop <Tab>";
        pb = ":patch rebase<Enter>";
        pt = ":patch term<Enter>";
        ps = ":patch switch <Tab>";
        "<C-p>" = ":prev-tab<Enter>";
        "<C-t>" = ":next-tab<Enter>";
        "<C-PgUp>" = ":prev-tab<Enter>";
        "<C-PgDn>" = ":next-tab<Enter>";
      };
      "messages:folder=Drafts" = {
        "<Enter>" = ":recall<Enter>";
      };
      view = {
        "/" = ":toggle-key-passthrough<Enter>/";
        q = ":close<Enter>";
        O = ":open<Enter>";
        S = ":save<space>";
        "|" = ":pipe<space>";
        D = ":delete<Enter>";
        A = ":archive flat<Enter>";
        "<C-y>" = ":copy-link <space>";
        "<C-l>" = ":open-link <space>";
        f = ":forward<Enter>";
        rr = ":reply -a<Enter>";
        rq = ":reply -aq<Enter>";
        Rr = ":reply<Enter>";
        Rq = ":reply -q<Enter>";
        H = ":toggle-headers<Enter>";
        E = ":next<Enter>";
        I = ":prev<Enter>";
        "<C-Right>" = ":next<Enter>";
        "<C-Left>" = ":prev<Enter>";
        "<C-e>" = ":next-part<Enter>";
        "<C-i>" = ":prev-part<Enter>";
        "<C-Up>" = ":prev-part<Enter>";
        "<C-Down>" = ":next-part<Enter>";
        "<C-p>" = ":prev-tab<Enter>";
        "<C-t>" = ":next-tab<Enter>";
        "<C-PgUp>" = ":prev-tab<Enter>";
        "<C-PgDn>" = ":next-tab<Enter>";
      };
      "view::passthrough" = {
        "$noinherit" = "true";
        "$ex" = "<C-x>";
        "<Esc>" = ":toggle-key-passthrough<Enter>";
      };
      compose = {
        "$noinherit" = "true";
        "$ex" = "<C-x>";
        "$complete" = "<Tab>";
        "<C-e>" = ":next-field<Enter>";
        "<C-i>" = ":prev-field<Enter>";
        "<C-Up>" = ":prev-field<Enter>";
        "<C-Down>" = ":next-field<Enter>";
        "<A-p>" = ":switch-account -p<Enter>";
        "<A-t>" = ":switch-account -n<Enter>";
        "<C-Left>" = ":switch-account -p<Enter>";
        "<C-Right>" = ":switch-account -n<Enter>";
        "<Tab>" = ":next-field<Enter>";
        "<Backtab>" = ":prev-field<Enter>";
        "<C-p>" = ":prev-tab<Enter>";
        "<C-t>" = ":next-tab<Enter>";
        "<C-PgUp>" = ":prev-tab<Enter>";
        "<C-PgDn>" = ":next-tab<Enter>";
      };
      "compose::editor" = {
        "$noinherit" = "true";
        "$ex" = "<C-x>";
        "<C-e>" = ":next-field<Enter>";
        "<C-i>" = ":prev-field<Enter>";
        "<C-Up>" = ":prev-field<Enter>";
        "<C-Down>" = ":next-field<Enter>";
        "<C-p>" = ":prev-tab<Enter>";
        "<C-t>" = ":next-tab<Enter>";
        "<C-PgUp>" = ":prev-tab<Enter>";
        "<C-PgDn>" = ":next-tab<Enter>";
      };
      "compose::review" = {
        c = ":send<Enter>";
        k = ":abort<Enter>";
        s = ":sign<Enter>";
        x = ":encrypt<Enter>";
        v = ":preview<Enter>";
        p = ":postpone<Enter>";
        q = ":choose -o d discard abort -o p postpone postpone<Enter>";
        f = ":edit<Enter>";
        a = ":attach<space>";
        d = ":detach<space>";
      };
      terminal = {
        "$noinherit" = "true";
        "$ex" = "<C-x>";
        "<C-p>" = ":prev-tab<Enter>";
        "<C-t>" = ":next-tab<Enter>";
        "<C-PgUp>" = ":prev-tab<Enter>";
        "<C-PgDn>" = ":next-tab<Enter>";
      };
    };
  };
}
