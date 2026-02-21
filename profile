#! /bin/bash

# Bash
alias emacs="emacs -nw -l ~/.emacs.d/zen.el"
alias pymake="python ~/.pymake/pymake.py"

export PATH=~/.local/bin:$PATH
export PATH=~/.bun/bin:$PATH

# C
export C_INCLUDE_PATH=$C_INCLUDE_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

# Golang
[ -f "$HOME/.g/env" ] && source "$HOME/.g/env"

export GO111MODULE=on

# Haskell
export PATH=~/.ghcup/bin:$PATH

# Python
export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH

pyenv=$(command -v pyenv || true)
if [[ $pyenv != "" ]]; then
    eval "$(pyenv init - zsh)"
fi

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
