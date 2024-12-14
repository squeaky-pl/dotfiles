$env.config = {
  show_banner: false
}

alias nu-http = http
alias http =  ~/.local/bin/uvx --from httpie http
alias pre-commit = ~/.local/bin/uvx pre-commit

use ~/.cache/starship/init.nu
