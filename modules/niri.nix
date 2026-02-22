{ pkgs, inputs, ... }:
{
  imports = [ inputs.niri-flake.homeModules.niri ];
  programs.niri = {
    enable = true;
    package = inputs.niri-flake.packages.x86_64-linux.niri-unstable;
    settings = {
      binds = 
        let
          mod = "Super";
        in
        {
          # navigation
          "${mod}+h".action.focus-column-or-monitor-left = {};
          "${mod}+j".action.focus-window-down = {};
          "${mod}+k".action.focus-window-up = {};
          "${mod}+l".action.focus-column-or-monitor-right = {};
          "${mod}+Shift+h".action.move-column-left-or-to-monitor-left = {};
          "${mod}+Shift+j".action.move-column-to-monitor-down = {};
          "${mod}+Shift+k".action.move-column-to-monitor-up = {};
          "${mod}+Shift+l".action.move-column-right-or-to-monitor-right = {};
          # workspace navigation
          "${mod}+1".action.focus-workspace = 1;
          "${mod}+2".action.focus-workspace = 2;
          "${mod}+3".action.focus-workspace = 3;
          "${mod}+4".action.focus-workspace = 4;
          "${mod}+5".action.focus-workspace = 5;
          "${mod}+6".action.focus-workspace = 6;
          "${mod}+7".action.focus-workspace = 7;
          "${mod}+8".action.focus-workspace = 8;
          "${mod}+9".action.focus-workspace = 9;
          "${mod}+Shift+1".action.move-window-to-workspace = 1;
          "${mod}+Shift+2".action.move-window-to-workspace = 2;
          "${mod}+Shift+3".action.move-window-to-workspace = 3;
          "${mod}+Shift+4".action.move-window-to-workspace = 4;
          "${mod}+Shift+5".action.move-window-to-workspace = 5;
          "${mod}+Shift+6".action.move-window-to-workspace = 6;
          "${mod}+Shift+7".action.move-window-to-workspace = 7;
          "${mod}+Shift+8".action.move-window-to-workspace = 8;
          "${mod}+Shift+9".action.move-window-to-workspace = 9;
          # spawn applications
          "${mod}+Q".action.spawn = "kitty";
          "${mod}+C".action.close-window = {};
          "${mod}+O".action.spawn = "fuzzel -w 100 -l 20";
          "${mod}+F".action.spawn = "qutebrowser";
          "${mod}+E".action.spawn = "element-desktop --password-store=gnome-libsecret";
          "${mod}+G".action.spawn = "signal-desktop --password-store=gnome-libsecret";
          # screenshot and clipboard
          "Print".action.spawn = "screenshot_region";
          "Shift+Print".action.spawn = "screenshot";
        };
      spawn-at-startup = [ { command = ["waybar"]; }];
    };
  };

  programs.waybar.enable = true;

}
