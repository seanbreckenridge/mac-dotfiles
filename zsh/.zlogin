# stuff that happens when you load an interactive shell

# list todos when you open a shell

${DOTDIR}/bin/todo --list

# setup ssh environment
# add any files that arent "known_hosts" or that
# end with ".pub" in the ~/.ssh directory 
# (your private keys) to the ssh-agent

eval `ssh-agent` > /dev/null
find "${HOME}/.ssh" -type file | \
    grep -v known_hosts | \
    grep -v "\\.pub" | \
    xargs -I {} ssh-add -q "{}"
