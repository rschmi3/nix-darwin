{ pkgs, user, ... }:
{

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users."${user}" = {
      imports = [
        ./ghostty
        ./tmux.nix
        ./window-manager
      ];

      windowManager = "aerospace";
      ghostty.enable = true;

      home = {
        packages = with pkgs; [ google-chrome ];
        sessionVariables = {
          EDITOR = "nvim";
        };
        stateVersion = "25.11";
      };

      programs = {
        fish = {
          enable = true;
          interactiveShellInit = ''
            eval "$(/opt/homebrew/bin/brew shellenv)"

            starship init fish | source
          '';
          shellAliases = {
            vim = "nvim";
            vi = "nvim";
            nixvim = "nix run github:rschmi3/nixvim";
          };
        };
        home-manager.enable = true;
      };
    };
  };
}
