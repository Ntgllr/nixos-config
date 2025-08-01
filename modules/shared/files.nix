{ pkgs, config, ... }:

let
  githubPublicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICSb5zMBtxPAxhdk4ttO3yk1QH3ODDfGG0aaRbnfxFmk";
  githubPublicSigningKey = ''
    -----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEaIyydxYJKwYBBAHaRw8BAQdA8rMyFX6OcAtBuqg+zWUOcdUrigmDj8QDKGpr
SBq4+xi0MU50Z2xsciA8NzY5NjI5MjIrTnRnbGxyQHVzZXJzLm5vcmVwbHkuZ2l0
aHViLmNvbT6IkAQTFgoAOBYhBFkzPM4771HqoyOrxcwAuOAiXy96BQJojLJ3AhsD
BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEMwAuOAiXy96bjgBAJvJ2JODtZQ5
Hf2gjYw+gVWQmqBHMSYmkm3UdU2BGkk0AQCNfDsYfzm+c8stfAYV7l6iXASMZqYO
Q9qxT0yPixT7Cbg4BGiMsncSCisGAQQBl1UBBQEBB0AXud2mHiEy2i1pUhK+7CwY
7SU9OyYewBCsEh9BqgkqCwMBCAeIeAQYFgoAIBYhBFkzPM4771HqoyOrxcwAuOAi
Xy96BQJojLJ3AhsMAAoJEMwAuOAiXy96ekMBAKRWL2tSdJN5YmJ+lupQu+TtZ7u+
lS/eQeRvHHGsmKeVAQDOAabcVO71act6LVhNfPy7sieNUjI13oKHrHdarK2EBg==
=pI2z
-----END PGP PUBLIC KEY BLOCK-----
  '';
in

{
  # Initializes Emacs with org-mode so we can tangle the main config
  #
  # @todo: Get rid of this after we've upgraded to Emacs 29 on the Macbook
  # Emacs 29 includes org-mode now
  ".emacs.d/init.el" = {
    text = builtins.readFile ./config/emacs/init.el;
  };

  # Emacs configuration in org-mode format
  ".config/emacs/config.org" = {
    text = builtins.readFile ./config/emacs/config.org;
  };

  ".ssh/id_github.pub" = {
    text = githubPublicKey;
  };

  ".ssh/pgp_github.pub" = {
    text = githubPublicSigningKey;
  };
}
