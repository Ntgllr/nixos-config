{ config, pkgs, lib, home-manager, ... }:

let
  user = "dgrothe2";


  myEmacsLauncher = pkgs.writeScript "emacs-launcher.command" ''
    #!/bin/sh
    emacsclient -c -n &
  '';
  sharedFiles     = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
   ./dock
  ];

  users.users.${user} = {
    name     = "${user}";
    home     = "/Users/${user}";
    isHidden = false;
    shell    = pkgs.zsh;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    casks = pkgs.callPackage ./casks.nix {};
    brews = [
      "bitwarden-cli"
      "r"
      "libgit2"
      "harfbuzz" 
      "fribidi"
      "freetype"
      "libpng"
      "libtiff"
      "libjpeg"
      "librsvg"
      "webp"
      # "openconnect"
      "dotnet"
      "protobuf"
      "rust"
      "typst"
      ];

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    # If you have previously added these apps to your Mac App Store profile (but not installed them on this system),
    # you may receive an error message "Redownload Unavailable with This Apple ID".
    # This message is safe to ignore. (https://github.com/dustinlyons/nixos-config/issues/83)

    masApps = {
      #"1password" = 1333542190;
      #"wireguard" = 1451685025;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:
      {
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
          { "emacs-launcher.command".source = myEmacsLauncher; }
        ];
        stateVersion = "23.11";
      };
      programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Stor
  local.dock = {
    enable   = true;
    username = user;
    entries  = [
      { path = "/Applications/QSpace Pro.app/"; }
      { path = "/Applications/Arc.app/"; }
      { path = "/Applications/Microsoft Outlook.app/"; }
      # { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
      { path = "/Applications/Alacritty.app/"; }
      { path = "/Applications/Positron.app/"; }
      { path = "/Applications/Zotero.app/"; }
      { path = "/Applications/Microsoft Word.app/"; }
      { path = "/Applications/Microsoft Excel.app/"; }
      { path = "/Applications/Microsoft PowerPoint.app/"; }
      { path = "/Applications/zoom.us.app/"; }
      {
        path = "${config.users.users.${user}.home}/sciebo/40-49_Uni/";
        section = "others";
        options = "--sort name --view list --display folder";
      }
      {
        path = "${config.users.users.${user}.home}/Downloads/";
        section = "others";
        options = "--sort datemodified --view list --display folder";
      }
    ];
  };
}
