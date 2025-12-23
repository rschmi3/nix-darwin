{
  lib,
  ...
}:
{
  options = {
    aerospace.enable = lib.mkEnableOption {
      description = "Enables and sets configs for aerospace";
      default = true;
    };
  };

  config = {
    programs.aerospace = {
      enable = true;
      launchd = {
        enable = false;
        keepAlive = false;
      };
      userSettings = {
        on-focus-changed = [ "move-mouse window-lazy-center" ];
        mode.main.binding = {
          # Launch Binds
          alt-enter = "exec-and-forget open -a Ghostty";

          # Focus Binds
          alt-left = "focus --boundaries all-monitors-outer-frame left";
          alt-right = "focus --boundaries all-monitors-outer-frame right";
          alt-up = "focus --boundaries all-monitors-outer-frame up";
          alt-down = "focus --boundaries all-monitors-outer-frame down";

          # Move Binds
          alt-shift-left = "move left";
          alt-shift-right = "move right";
          alt-shift-up = "move up";
          alt-shift-down = "move down";

          # Focus Monitor Binds
          alt-comma = "focus-monitor left";
          alt-period = "focus-monitor right";

          # Move Workspace Binds
          alt-shift-comma = "move-workspace-to-monitor left";
          alt-shift-period = "move-workspace-to-monitor right";

          # Workspace binds
          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";
          alt-7 = "workspace 7";
          alt-8 = "workspace 8";
          alt-9 = "workspace 9";
          alt-0 = "workspace 10";
          alt-a = "workspace 6";
          alt-s = "workspace 7";
          alt-d = "workspace 8";
          alt-f = "workspace 4";
          alt-g = "workspace 10";
          alt-h = "workspace 1";
          alt-j = "workspace 2";
          alt-k = "workspace 3";
          alt-l = "workspace 4";
          alt-semicolon = "workspace 5";

          # Move node to workspace binds
          alt-shift-1 = [
            "move-node-to-workspace 1"
            "workspace 1"
          ];
          alt-shift-2 = [
            "move-node-to-workspace 2"
            "workspace 2"
          ];
          alt-shift-3 = [
            "move-node-to-workspace 3"
            "workspace 3"
          ];
          alt-shift-4 = [
            "move-node-to-workspace 4"
            "workspace 4"
          ];
          alt-shift-5 = [
            "move-node-to-workspace 5"
            "workspace 5"
          ];
          alt-shift-6 = [
            "move-node-to-workspace 6"
            "workspace 6"
          ];
          alt-shift-7 = [
            "move-node-to-workspace 7"
            "workspace 7"
          ];
          alt-shift-8 = [
            "move-node-to-workspace 8"
            "workspace 8"
          ];
          alt-shift-9 = [
            "move-node-to-workspace 9"
            "workspace 9"
          ];
          alt-shift-0 = [
            "move-node-to-workspace 10"
            "workspace 10"
          ];
          alt-shift-a = [
            "move-node-to-workspace 6"
            "workspace 6"
          ];
          alt-shift-s = [
            "move-node-to-workspace 7"
            "workspace 7"
          ];
          alt-shift-d = [
            "move-node-to-workspace 8"
            "workspace 8"
          ];
          alt-shift-f = [
            "move-node-to-workspace 9"
            "workspace 9"
          ];
          alt-shift-g = [
            "move-node-to-workspace 10"
            "workspace 10"
          ];
          alt-shift-h = [
            "move-node-to-workspace 1"
            "workspace 1"
          ];
          alt-shift-j = [
            "move-node-to-workspace 2"
            "workspace 2"
          ];
          alt-shift-k = [
            "move-node-to-workspace 3"
            "workspace 3"
          ];
          alt-shift-l = [
            "move-node-to-workspace 3"
            "workspace 4"
          ];
          alt-shift-semicolon = [
            "move-node-to-workspace 5"
            "workspace 5"
          ];
        };
      };
    };
  };
}
