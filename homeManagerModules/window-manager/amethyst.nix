{ lib, ... }:
{
  options = {
    amethyst.enable = lib.mkEnableOption {
      description = "Enables and sets configs for amethyst";
      default = true;
    };
  };
  config = { };
}
