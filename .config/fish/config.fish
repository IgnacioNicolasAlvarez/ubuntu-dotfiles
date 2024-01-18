if status is-interactive
    # Commands to run in interactive sessions can go here
end

# alias
alias rasp01='ssh inapi@192.168.100.30'
alias oxx='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock:ro --pull=always ghcr.io/mrjackwills/oxker'
alias telegram='flatpak run org.telegram.desktop'
alias spotify='flatpak run com.spotify.Client'

zoxide init fish | source
starship init fish | source
