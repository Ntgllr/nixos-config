{ pkgs, lib, config, ... }:

let home = builtins.getEnv "HOME";
in {
  home.packages = pkgs.callPackage ./packages.nix {};
  programs = {
    git = {
      enable = true;
      userName = "Dustin Lyons";
      userEmail = "hello@dustinlyons.co";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
