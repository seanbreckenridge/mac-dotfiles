# dotfiles

there are many `dotfiles`, but these are mine.

My `dotfiles` directory sits at `~/dotfiles`, each directory includes an relevant `install.sh` file, you can run all of them by running [`./setup`](/setup).

[bin](/bin), [functions](/zsh/functions), and [redshift](/redshift) have the most interesting things here.

Notes:
- `setup` sets `$ZDOTDIR` to `~/dotfiles/zsh/`, and symlinks `~/dotfiles/zsh/.zshenv` to `~/.zshenv`
- `setup` sets `$ZSH_CUSTOM` to `~/dotfiles/zsh/custom`, so any additional plugins/themes should be put there
- `atom/install.sh` symlinks `atom/atom` to `~/.atom`, the directory atom uses to store its config
- the way I run redshift is a bit strange, [notes on `redshift`](/redshift/README.md)
- [todo](/bin/todo) creates a todo on the Desktop, todos are listed when a shell is opened

### installation

    cd # go home
    curl https://raw.githubusercontent.com/seanbreckenridge/dotfiles/master/pre-setup > pre-setup
    bash -c pre-setup
    git clone https://github.com/seanbreckenridge/dotfiles
    ./dotfiles/setup
