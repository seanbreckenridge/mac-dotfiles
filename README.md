# dotfiles

there are many `dotfiles`, but these are mine.

My `dotfiles` directory sits at `~/dotfiles`, each directory includes an relevant `install.sh` file, you can run all of them by running [`./setup`](/setup).

[redshift](/redshift), [bin](/bin), and [functions](/zsh/functions) have the most interesting things here.


### installation

    cd # go home
    curl https://raw.githubusercontent.com/seanbreckenridge/dotfiles/56a033c187991a72d53d80f714d2489e206e94ae/pre-setup > pre-setup
    bash pre-setup
    git clone https://github.com/seanbreckenridge/dotfiles
    ./dotfiles/setup
