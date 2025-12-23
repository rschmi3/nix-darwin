{ config, lib, ... }:
{
  imports = [
    ./aerospace.nix
    ./amethyst.nix
  ];

  options = {
    windowManager = lib.mkOption {
      type = lib.types.enum [
        "aerospace"
        "amethyst"
      ];
      default = "aerospace";
      description = "Window manager to enable";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.windowManager == "aerospace") {
      aerospace.enable = true;
    })
    (lib.mkIf (config.windowManager == "amethyst") {
      amethyst.enable = true;
    })
  ];
}
