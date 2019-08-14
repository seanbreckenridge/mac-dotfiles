
"""Script to keep track of the last time I ran brew cask upgrade --greedy

From man brew-cask:

If --greedy is given then also include in the output the Casks having
auto_updates true or version :latest.
Otherwise they are skipped because there is no reliable way to know when updates are available for them.
"""

import os
import sys
import time
import json

# exit codes
# 0 == run greedy cask upgrade
# 1 == don't run greedy cask upgrade
#
# meant to be used like:
# python3 greedy_upgrade && brew cask upgrade --greedy

homebrew_dir = os.path.abspath(os.path.dirname(__file__))
last_greedy_upgrade_filepath = os.path.join(homebrew_dir, "last_greedy_upgrade.json")
A_MONTH = 60 * 60 * 24 * 30


def run_greedy_upgrade():
    """Update the json file and exit with a return code of 0 - run 'brew cask upgrade --greedy'"""
    with open(last_greedy_upgrade_filepath, 'w') as f:
        json.dump({"last_greedy_run": int(time.time())}, f)
    return 0


def main() -> int:

    ret_code = 1

    if not os.path.exists(last_greedy_upgrade_filepath):
        ret_code = run_greedy_upgrade()
    else:

        # read when we last ran a greedy upgrade
        with open(last_greedy_upgrade_filepath, 'r') as f:
            last_run_at = json.load(f)["last_greedy_run"]

        if time.time() - last_run_at > A_MONTH:  # if its been a month since we ran greedy upgrade
            ret_code = run_greedy_upgrade()

    return ret_code


if __name__ == "__main__":
    try:
        sys.exit(main())
    except ValueError:  # json related errors
        print(f"There was an error reading from '{last_greedy_upgrade_filepath}', removing...",
              file=sys.stderr)
        os.remove(last_greedy_upgrade_filepath)
        sys.exit(run_greedy_upgrade())  # run greedy upgrade
