#!/bin/bash -xe

GREEN_TERMINAL_OUTPUT = \033[1;32m
RED_TERMINAL_OUTPUT = \033[1;31m
CLEAR = \033[0m

echo -e "${GREEN_TERMINAL_OUTPUT}--> Tangling Emacs.org...${CLEAR}"
emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "Emacs.org")'

echo -e "${GREEN_TERMINAL_OUTPUT}--> Tangling Nix.org...${CLEAR}"
emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "Nix.org")'
