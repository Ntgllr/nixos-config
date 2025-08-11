{ pkgs, ... }:
let
  myPython = pkgs.python3.withPackages (ps: with ps; [
    slpp
    pip
    rich
    virtualenv
    black
    uv
  ]);

  # myPHP = pkgs.php82.withExtensions ({ enabled, all }: enabled ++ (with all; [
  #   xdebug
  # ]));

  myFonts = import ./fonts.nix { inherit pkgs; };
in
with pkgs; [
  # A
  act # Run Github actions locally
  age # File encryption tool
  age-plugin-yubikey # YubiKey plugin for age encryption
  alacritty # GPU-accelerated terminal emulator
  aspell # Spell checker
  aspellDicts.en # English dictionary for aspell
  aspellDicts.de # German dictionary for aspell

  # B
  bash-completion # Bash completion scripts
  bat # Cat clone with syntax highlighting
  btop # System monitor and process viewer

  # C
  coreutils # Basic file/text/shell utilities

  # D
  direnv # Environment variable management per directory
  difftastic # Structural diff tool
  du-dust # Disk usage analyzer

  # F
  fd # Fast find alternative
  ffmpeg # Multimedia framework
  fzf # Fuzzy finder

  # G
  gcc # GNU Compiler Collection
  gh # GitHub CLI
  glow # Markdown renderer for terminal
  gnupg # GNU Privacy Guard
  gopls # Go language server

  # H
  htop # Interactive process viewer
  hunspell # Spell checker

  # I
  iftop # Network bandwidth monitor
  imagemagick # Image manipulation toolkit

  # J
  jpegoptim # JPEG optimizer
  jq # JSON processor

  # K
  killall # Kill processes by name

  # L
  lnav # Log file navigator
  libfido2 # FIDO2 library
  lowfi # Lowfi music player

  # M
  # myPHP # Custom PHP with extensions
  myPython # Custom Python with packages
  mangal # Manga reader

  # N
  ncurses # Terminal control library with terminfo database
  neofetch # System information tool
  ngrok # Secure tunneling service
  nodePackages.live-server # Development server with live reload
  nodePackages.nodemon # Node.js file watcher
  nodePackages.npm # Node package manager
  (hiPrio nodePackages.prettier) # Code formatter
  neovim # Text editor
  nss_latest # Latest Network Security Services library

  # O
  openssh # SSH client and server
  openconnect # VPN client

  # P
  pandoc # Document converter
  php82Packages.composer # PHP dependency manager
  php82Packages.deployer # PHP deployment tool
  php82Packages.php-cs-fixer # PHP code style fixer
  phpunit # PHP testing framework
  pngquant # PNG compression tool
  podman # Container management tool
  podman-compose # Podman compose tool
  positron-bin # Data science IDE for Python and R

  # Q
  # quarto # Scientific and technical publishing system

  # R
  ripgrep # Fast text search tool

  # S
  slack # Team communication app
  sqlite # SQL database engine

  # T
  terraform # Infrastructure as code tool
  terraform-ls # Terraform language server
  tflint # Terraform linter
  tmux # Terminal multiplexer
  tree # Directory tree viewer

  # U
  unrar # RAR archive extractor
  unzip # ZIP archive extractor
  # uv # Python package installer

  # W
  wget # File downloader

  # Z
  zip # ZIP archive creator
  zsh-powerlevel10k # Zsh theme
] ++ myFonts
