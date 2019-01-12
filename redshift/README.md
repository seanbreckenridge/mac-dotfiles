
### redshift

This is for Mac. I could have done [this](https://github.com/jonls/redshift/issues/398), and launched redshift on login, but its annoying to kill, and running 2 instances of redshift isn't possible and leads to flickering.

autoredshift.app opens a terminal window on login, starts redshift and minimizes it, so I can change the brightness manually (e.g. `redshift -O 3500`), or stop it any point if, for example, I'm doing color sensitive work.

Contents of `autoredshift.app`:

`Run AppleScript`:

    tell application "Terminal"
       if not (exists window 1) then reopen
       activate
       do script "redshift -O 3500" in window 1
       set miniaturized of window 1 to true
    end tell
