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

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
$env.PROMPT_INDICATOR_VI_INSERT = { "" }
$env.PROMPT_INDICATOR_VI_NORMAL = { "| " }
