{
  lib,
  pkgs,
  ...
}:
{
  options = {
    ghostty.enable = lib.mkEnableOption {
      description = "Enables and sets configs for ghostty";
      default = true;
    };
  };

  config = {
    home = {
      file = {
        ".config/ghostty/config".source = ./configs/config;
        ".config/ghostty/themes" = {
          source = ./configs/themes;
          recursive = true;
        };
        ".config/ghostty/user".source = ./configs/users/rschmi3;
      };

      packages = [
        pkgs.ghostty-bin
      ];
    };
  };
}
