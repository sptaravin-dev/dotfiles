$env.config = {
  edit_mode: vi
  keybindings: [
    {
      name: take_history_hint
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          { send: historyhintcomplete }
        ]
      }
    }
  ]
}

alias v = nvim
alias l = ls -a
alias cl = clear
alias lt = eza --tree --level=2 --long --icons --git
alias cz = chezmoi
alias lg = lazygit

use $ENV_DIR starship STARSHIP_INIT_PATH
use $STARSHIP_INIT_PATH
hide STARSHIP_INIT_PATH
$env.PROMPT_INDICATOR_VI_INSERT = { "" }
$env.PROMPT_INDICATOR_VI_NORMAL = { "| " }
