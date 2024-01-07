{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.python3 pkgs.git ];
  shellHook = ''
    if [ ! -d "$(basename $(pwd))" ]; then
      python -m venv $(basename $(pwd))
    fi
    source $(basename $(pwd))/bin/activate
    pip install pip-autoremove
    pip install -r requirements.txt
    pip-autoremove --yes
  '';
}

# Asjust pkgs.python3 to a specific version if needed
# Place your pip package requirements in requirements.txt
# Run nix-shell should create or enter the venv named after project directory
# and install, update, or remove any requirements
