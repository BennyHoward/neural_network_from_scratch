# This is a sample profile script for some convenince shell functions you may want to consider adding to your own .profile or .bashrc or .bash_profile or .zshrc file

# Convenience function (and alias) to automatically activate/deactivate Python virtual environments if a `venv` folder (with an actual Python virtual environment) is present in the ancestral directories (until the $HOME directory).
# Add this function to the .profile or the .bashrc or .zshrc file to automaticlly activte/deactivate Python virtual environments when entering/leaving directories.
# NOTE: This WILL limit itself to only subdirectoires of the $HOME directory.
# NOTE: Some Mac users may notice that .bashrc may not automatically load when using bash.
function cd_venv {
  # Run the cd command as normal
  builtin cd "$@"

  # Check is Python exits, otherwise, no point in continuing
  if [[ ! $(which python) ]]; then
    return 0
  fi

  # Track the current directory when searching for the Python virtual environment activation file
  local CURRENT_DIR="$(pwd)"
  while [[ $(echo "$CURRENT_DIR" | grep "^$HOME") ]] && [[ "$CURRENT_DIR" != "$HOME" ]]; do
    # Does $CURRENT_DIR/venv/bin/activate exist AND it's a valid shell script
    if [[ -d "$CURRENT_DIR/venv" ]] && [[ -f "$CURRENT_DIR/venv/bin/activate" ]]; then
      # Already in current Python virtual environment
      if [[ "$VIRTUAL_ENV" == "$CURRENT_DIR/venv" ]]; then
        # Do nothing
        return 0
      # In another Python virtual environment
      elif [[ "$VIRTUAL_ENV" ]] && [[ "$VIRTUAL_ENV" != "$CURRENT_DIR/venv" ]]; then
        # Deactivate the old Python virtual environment and re-enter the current Python virtual environment
        deactivate
        source "$CURRENT_DIR/venv/bin/activate"
        return 0
      elif [[ ! "$VIRTUAL_ENV" ]] && [[ "$VIRTUAL_ENV" != "$CURRENT_DIR/venv" ]]; then
        # Activate the current Python virtual environment
        source "$CURRENT_DIR/venv/bin/activate"
        return 0
      fi
    fi
    CURRENT_DIR=$(dirname $CURRENT_DIR)
  done
  # If this point is reached, it means that no Python Virtual Environment was found.
  # Deactivate if already in a Python Virtual Environment
  if [[ "$VIRTUAL_ENV" ]]; then
    deactivate
  fi
}
alias cd='cd_venv'
# This will attempt to activate the Python Virtual Environment on terminal start
cd .
