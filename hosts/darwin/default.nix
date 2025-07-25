{ agenix, config, pkgs, ... }:

let user = "dgrothe2"; in

{

  imports = [
    ../../modules/darwin/secrets.nix
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
     agenix.darwinModules.default
  ];
  # Setup user, packages, programs
  nix = {
    package = pkgs.nix;
    settings = {
      trusted-users = [ "@admin" "${user}" ];
      substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
    };

    gc = {
      automatic = true; #TODO: Auskommentieren, wenn Fehler
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };
    # Turn this on to make command line easier
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  # Load configuration that is shared across systems
  environment.systemPackages = with pkgs; [
    emacs
    agenix.packages."${pkgs.system}".default
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  #launchd.user.agents = {
  #  emacs = {
  #    path = [ config.environment.systemPath ];
  #    serviceConfig = {
  #      KeepAlive = true;
  #      ProgramArguments = [
  #        "/bin/sh"
  #        "-c"
  #        "{ osascript -e 'display notification \"Attempting to start Emacs...\" with title \"Emacs Launch\"'; /bin/wait4path ${pkgs.emacs}/bin/emacs && { ${pkgs.emacs}/bin/emacs --fg-daemon; if [ $? -eq 0 ]; then osascript -e 'display notification \"Emacs has started.\" with title \"Emacs Launch\"'; else osascript -e 'display notification \"Failed to start Emacs.\" with title \"Emacs Launch\"' >&2; fi; } } &> /tmp/emacs_launch.log"
  #      ];
  #      StandardErrorPath = "/tmp/emacs.err.log";
  #      StandardOutPath = "/tmp/emacs.out.log";
  #    };
  #  };
  #};

  system = {
    # Turn off NIX_PATH warnings now that we're using flakes
    checks.verifyNixPath = false;
    primaryUser = user;
    stateVersion = 4;

    defaults = {
      LaunchServices = {
        LSQuarantine = false;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = false;
        ApplePressAndHoldEnabled = false;
        AppleWindowTabbingMode = "always";
        NSAutomaticWindowAnimationsEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 2;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 15;

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.4; # problems with float values?
        static-only = false;
        show-recents = false;
        launchanim = false;
        orientation = "left";
        tilesize = 48;

        wvous-bl-corner = 2; # Bottom left -> Mission Control
        wvous-tr-corner = 12; # Top right -> Notification Center
        wvous-tl-corner = 3; # Top left -> App Windows
      };

      finder = {
        _FXShowPosixPathInTitle = false;
        ShowPathbar = true;
        _FXSortFoldersFirst = true;
        QuitMenuItem = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };

      screencapture = {
        location = "~/Pictures/screenshots";
      };

      loginwindow = {
        GuestEnabled = false;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  # Sudo per fingerprint
  #security.pam.enableSudoTouchIdAuth = true; <- old
  security.pam.services.sudo_local.touchIdAuth = true;
}
