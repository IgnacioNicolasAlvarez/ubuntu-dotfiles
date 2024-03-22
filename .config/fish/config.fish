if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# alias
alias rasp01='ssh inapi@192.168.100.30'
alias oxx='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock:ro --pull=always ghcr.io/mrjackwills/oxker'

alias sys-update='sudo apt update && sudo apt upgrade -y'
alias dc-up='docker compose up -d'
alias dc-down='docker compose down'
alias dc-ps='docker compose ps'
alias dc-logs='docker compose logs -f'
alias dc-build='docker compose build'


zoxide init fish | source
starship init fish | source


alias z='zoxide'

alias tbc='toggle_bluetooth_controller'