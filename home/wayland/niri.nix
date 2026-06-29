{ inputs, config, ... }:
let
  colors = inputs.evergarden.lib.util.mkPalette config.evergarden;
in
{
  services.gnome-keyring.enable = false;

  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "awww restore" ]; }
    ];

    screenshot-path = "/tmp/screenshots/%s.png";
    prefer-no-csd = true;

    cursor = {
      theme = "Qogir";
      size = 24;
    };

    input = {
      keyboard = {
        repeat-delay = 160;
        repeat-rate = 70;
        numlock = true;
      };

      mouse.accel-profile = "flat";
      focus-follows-mouse.enable = false;
    };

    gestures.hot-corners.enable = false;

    outputs = {
      HDMI-A-1 = {
        scale = 1;
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        focus-at-startup = true;
        position = {
          x = 0;
          y = 0;
        };
      };

      eDP-1 = {
        scale = 1;
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 1920;
          y = 0;
        };
      };
    };

    layout = {
      gaps = 8;
      center-focused-column = "never";
      background-color = "transparent";

      default-column-width.proportion = 0.5;

      focus-ring.enable = false;
      border = {
        enable = true;
        width = 2;
        active.color = "#${colors.accent}";
        inactive.color = "#${colors.surface0}";
        urgent.color = "#${colors.yellow}";
      };
    };

    # TODO: uncomment on next release
    # recent-windows.enable = false;

    animations = {
      window-open.kind.easing = {
        duration-ms = 400;
        curve = "cubic-bezier";
        curve-args = [
          0.23
          1
          0.32
          1
        ];
      };

      window-close.kind.easing = {
        duration-ms = 400;
        curve = "cubic-bezier";
        curve-args = [
          0.23
          1
          0.32
          1
        ];
      };
    };

    workspaces = {
      "1".open-on-output = "HDMI-A-1";
      "2".open-on-output = "HDMI-A-1";
      "3".open-on-output = "HDMI-A-1";
      "social".open-on-output = "eDP-1";
    };

    window-rules = [
      {
        clip-to-geometry = true;
      }
      {
        matches = [ { app-id = "^Rofi"; } ];
        open-floating = true;
        open-focused = true;
      }
      {
        matches = [ { app-id = "^vesktop"; } ];
        open-on-workspace = "social";
        open-maximized = true;
      }
      {
        matches = [ { title = "^(Picture in picture|Picture-in-Picture|Discord Popout)"; } ];
        default-column-width.fixed = 800;
        default-window-height.fixed = 450;
        open-floating = true;
        open-focused = false;
        default-floating-position = {
          x = 0;
          y = 0;
          relative-to = "bottom-right";
        };
      }
      {
        matches = [ { title = "^notificationtoast.*"; } ];
        open-floating = true;
        default-floating-position = {
          x = 0;
          y = 0;
          relative-to = "bottom-right";
        };
      }
    ];

    layer-rules = [
      {
        matches = [ { namespace = "^awww-daemon"; } ];
        place-within-backdrop = true;
      }
    ];

    hotkey-overlay.skip-at-startup = true;

    binds = {
      "mod+k".action.spawn = [ "footclient" ];
      "mod+m".action.spawn = [ "rofi" "-show" "drun" ];

      "mod+comma".action.close-window = [ ];
      "mod+backslash".action.show-hotkey-overlay = [ ];
      "mod+q".action.quit = [ ];

      "alt+n".action.focus-column-left = [ ];
      "alt+e".action.focus-window-down = [ ];
      "alt+i".action.focus-window-up = [ ];
      "alt+o".action.focus-column-right = [ ];

      "alt+shift+n".action.move-column-left = [ ];
      "alt+shift+e".action.move-window-down = [ ];
      "alt+shift+i".action.move-window-up = [ ];
      "alt+shift+o".action.move-column-right = [ ];

      "alt+home".action.focus-column-first = [ ];
      "alt+end".action.focus-column-last = [ ];
      "alt+shift+home".action.move-column-to-first = [ ];
      "alt+shift+end".action.move-column-to-last = [ ];

      "alt+ctrl+n".action.consume-or-expel-window-left = [ ];
      "alt+ctrl+e".action.consume-or-expel-window-right = [ ];
      "alt+ctrl+i".action.consume-or-expel-window-left = [ ];
      "alt+ctrl+o".action.consume-or-expel-window-right = [ ];

      "alt+m".action.toggle-window-floating = [ ];
      "alt+comma".action.switch-focus-between-floating-and-tiling = [ ];

      "alt+u".action.switch-preset-column-width = [ ];
      "alt+y".action.maximize-column = [ ];

      "mod+l".action.expand-column-to-available-width = [ ];
      "mod+u".action.fullscreen-window = [ ];
      "mod+y".action.toggle-windowed-fullscreen = [ ];

      "alt+tab".action.toggle-overview = [ ];

      "mod+n".action.focus-workspace-up = [ ];
      "mod+e".action.focus-workspace-down = [ ];
      "mod+i".action.focus-workspace-up = [ ];
      "mod+o".action.focus-workspace-down = [ ];

      "mod+shift+n".action.move-column-to-workspace-up = [ ];
      "mod+shift+e".action.move-column-to-workspace-down = [ ];
      "mod+shift+i".action.move-column-to-workspace-up = [ ];
      "mod+shift+o".action.move-column-to-workspace-down = [ ];

      "alt+1".action.focus-workspace = 1;
      "alt+2".action.focus-workspace = 2;
      "alt+3".action.focus-workspace = 3;
      "alt+4".action.focus-workspace = "social";

      "mod+1".action.move-column-to-workspace = 1;
      "mod+2".action.move-column-to-workspace = 2;
      "mod+3".action.move-column-to-workspace = 3;
      "mod+4".action.move-column-to-workspace = "social";

      "mod+ctrl+n".action.set-column-width = "-10%";
      "mod+ctrl+e".action.set-window-height = "+10%";
      "mod+ctrl+i".action.set-window-height = "-10%";
      "mod+ctrl+o".action.set-column-width = "+10%";

      "print".action.screenshot = [ ];
      "shift+print".action.screenshot-window = [ ];
      "ctrl+print".action.screenshot-screen = [ ];
    };
  };
}
