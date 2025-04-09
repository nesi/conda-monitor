function prevent_conda_init() {
  if [[ "$BASH_COMMAND" == *"conda init"* || "$BASH_COMMAND" == *"conda shell.bash hook"* ]]; then
    echo "WARNING: 'conda init' and modifications to ~/.bashrc have been disabled by system policy."
    echo "Please use 'conda activate' directly after loading the module instead."
    echo "To use conda without modifying ~/.bashrc, run: source \$CONDA_PREFIX/etc/profile.d/conda.sh"
    return 1
  fi
}
trap prevent_conda_init DEBUG
