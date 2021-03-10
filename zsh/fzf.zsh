export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export FZF_DEFAULT_COMMAND='fd'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | bat {} --preview-window=down'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    vim)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}
