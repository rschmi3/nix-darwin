{
  pkgs,
  ...
}:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    terminal = "tmux-256color";
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    extraConfig = ''
      set -g display-time 4000
      set -g status-position top
      set -g set-clipboard on
      set -g mouse on
      set-option -g renumber-windows on
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';

    plugins = with pkgs.tmuxPlugins; [
      battery
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "macchiato"
          set -g @catppuccin_window_status_style "rounded"
          set -g status-right-length 100
          set -g status-left-length 100
          set -g status-left ""
          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -agF status-right "#{E:@catppuccin_status_battery}"
        '';
      }
      tmux-which-key
    ];
  };
}
