# dotfiles

there are many `dotfiles`, but these are mine.

Note these are for mac. I have a branch for [Linux Mint](https://github.com/seanbreckenridge/dotfiles/tree/linux-mint), but that should work on many different distros. 

My `dotfiles` directory sits at `~/dotfiles`, each directory includes an relevant `install.sh` file, you can run all of them by running [`./setup`](/setup).

[bin](/bin), and [functions](/zsh/functions) have the most interesting things here.

Notes:
- `setup` sets `$ZDOTDIR` to `~/dotfiles/zsh/`, and symlinks `~/dotfiles/zsh/.zshenv` to `~/.zshenv`
- `setup` sets `$ZSH_CUSTOM` to `~/dotfiles/zsh/custom`, so any additional plugins/themes should be put there (i.e. in `~/dotfiles/zsh/custom/themes`)
- [todo](/bin/todo) creates a todo on the Desktop, todos are listed when a shell is opened

### installation

    cd # go home
    # install developer tools
    xcode-select --install
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/seanbreckenridge/dotfiles
    ./dotfiles/setup
