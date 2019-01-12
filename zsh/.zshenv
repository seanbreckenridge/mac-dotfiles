# first dotfile to be loaded - define environment variables

# the dotfiles directory
export DOTDIR="${HOME}/dotfiles"

# rest of zsh dotfile configuration should be done in ~/dotfiles/zsh
export ZDOTDIR="${DOTDIR}/zsh"

# custom config files and plugins at ~/dotfiles/zsh/custom
export ZSH_CUSTOM="${ZDOTDIR}/custom"

# locations for additional functions
export fpath=( "${ZDOTDIR}/functions" ${fpath[@]} )

# Path
PATH="\
/usr/local/bin:\
${HOME}/bin:\
${DOTDIR}/bin:\
${DOTDIR}/bin/wrappers:\
${HOME}/.cargo/bin:\
${PATH}"
export PATH

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='atom'
fi

# Pager
export PAGER=less

# history file for zsh
export HISTFILE="${ZDOTDIR}/.zsh_history"

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Brewfile location
export HOMEBREW_BREWFILE="${DOTDIR}/homebrew/Brewfile"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# source order:
# .zshenv → [.zprofile if login] → [.zshrc if interactive] → [.zlogin if login] → [.zlogout sometimes]. –

# .zprofile is meant as an alternative to `.zlogin' for ksh fans; the two are not intended to be used together, although this could certainly be done if desired."
