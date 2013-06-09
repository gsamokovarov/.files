# The smiley faces in Ubuntu Mono or Inconsolata are displayed in the width of
# two characters. I keep a space after them, so they render nicely on my
# terminal. Feel free to export the variables below for your fonts.
export SMILEY_HAPPY_FACE="☺ "
export SMILEY_SAD_FACE="☹ "
export SMILEY_BRANCH_SYMBOL="⭠"

# The Vi-Mode prompt use this to determine the format.
export MODE_INDICATOR=" %{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"

smiley_face() {
  print "%(?:%{$fg_bold[cyan]%}%B${SMILEY_HAPPY_FACE}%b:%{$fg_bold[red]%}%B${SMILEY_SAD_FACE}%b)"
}

smiley_remote_host_info() {
  if [[ -n "$SSH_CLIENT" ]]; then
    print "%{$fg_bold[red]%}%B${HOST}%b%{$reset_color%} "
  fi
}

PROMPT='$(smiley_remote_host_info)$(smiley_face) %{$reset_color%}'
RPROMPT='%B%1~%b$(git_prompt_info)$(vi_mode_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}${SMILEY_BRANCH_SYMBOL}%{$fg_no_bold[cyan]%} %B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$reset_color%}"
