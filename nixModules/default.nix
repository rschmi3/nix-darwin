{
  pkgs,
  self,
  user,
  ...
}:
{
  imports = [ ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {

    systemPackages = with pkgs; [
      btop
      fastfetch
      neovim
      slack
      starship
      vim
    ];
  };

  fonts.packages = with pkgs; [
    comic-mono
    font-awesome
    fira-code
    fira-code-symbols
    iosevka
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    source-han-sans
    source-han-serif
  ];

  homebrew = {
    enable = true;
  };

  nix = {
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  # Enable alternative shell support in nix-darwin.
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish.enable = true;
  };

  services = {
    tailscale = {
      enable = true;
    };
  };

  # Set Git commit hash for darwin-version.
  system = {
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = user;
    stateVersion = 6;
  };

  users = {
    knownUsers = [ user ];
    users = {
      "${user}" = {
        name = user;
        home = "/Users/${user}";
        shell = pkgs.fish;
        uid = 502;
      };
    };
  };
}
