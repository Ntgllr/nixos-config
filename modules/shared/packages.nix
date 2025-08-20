{ pkgs, ... }:
let
  myPython = pkgs.python3.withPackages (ps: with ps; [
    pip
    virtualenv
    uv
  ]);

  myFonts = import ./fonts.nix { inherit pkgs; };
in
with pkgs; [
  # A
  # act # Run Github actions locally
  age # File encryption tool
  age-plugin-yubikey # YubiKey plugin for age encryption
  alacritty # GPU-accelerated terminal emulator
  air-formatter # R formatter and LSP
  alacritty-theme # Collection of Alacritty color schemes
  # aspell # Spell checker
  # aspellDicts.en # English dictionary for aspell
  # aspellDicts.de # German dictionary for aspell

  # B
  bat # Cat clone with syntax highlighting
  btop # System monitor and process viewer

  # C
  coreutils # Basic file/text/shell utilities
  cmake

  # D
  direnv # Environment variable management per directory
  difftastic # Structural diff tool
  du-dust # Disk usage analyzer

  # E
  eza # modern ls-replacement

  # F
  fd # Fast find alternative
  ffmpeg # Multimedia framework
  fzf # Fuzzy finder

  # G
  gcc # GNU Compiler Collection
  gh # GitHub CLI
  glow # Markdown renderer for terminal
  gnupg # GNU Privacy Guard

  # H
  htop # Interactive process viewer
  hunspell # Spell checker
  # helix # Terminal editor

  # I
  iftop # Network bandwidth monitor
  imagemagick # Image manipulation toolkit

  # J
  jq # JSON processor

  # K
  killall # Kill processes by name

  # L
  lnav # Log file navigator
  libfido2 # FIDO2 library
  lowfi # Lowfi music player
  lazygit # Git CLI

  # M
  myPython # Custom Python with packages
  mangal # Manga reader
  mupdf # PDF/Ebook viewer

  # N
  neofetch # System information tool
  neovim # Text editor
  nss_latest # Latest Network Security Services library

  # O
  openssh # SSH client and server
  openconnect # VPN client
  oh-my-posh # Prompt theme engine

  # P
  pandoc # Document converter
  podman # Container management tool
  podman-compose # Podman compose tool
  positron-bin # Data science IDE for Python and R
  poppler # PDF library

  # Q
  # quarto # Scientific and technical publishing system

  # R
  ripgrep # Fast text search tool
  radian # R terminal repl

  # S
  sqlite # SQL database engine

  # T
  typstyle # Typst formatter
  tinymist # Typst LSP
  tmux # Terminal multiplexer
  tree # Directory tree viewer

  # U
  unrar # RAR archive extractor
  unzip # ZIP archive extractor
  # uv # Python package installer

  # V
  vpn-slice

  # W
  wget # File downloader

  # Z
  zip # ZIP archive creator
  # zsh-powerlevel10k # Zsh theme
  zoxide # Fast cd command
  zinit # Flexible zsh plugin manager
  zsh-fzf-tab # Replace zsh's default completion selection menu with fzf
  # zellij # Terminal multiplexer
  zathura # PDF viewer
] ++ myFonts
