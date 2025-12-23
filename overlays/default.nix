{ nixvim-config, ... }:
{
  nixpkgs.overlays = [
    (final: prev: { neovim = nixvim-config; })
  ];
}
