# The smiley faces in Ubuntu Mono or Inconsolata are displayed in the width of
# two characters. I keep a space after them, so they render nicely on my
# terminal. Feel free to export the variables below for your fonts.
export SMILEY_HAPPY_FACE="☺ "
export SMILEY_SAD_FACE="☹ "

smiley_face() {
  print "%(?:%{$fg_bold[yellow]%}%B${SMILEY_HAPPY_FACE}%b:%{$fg_bold[red]%}%B${SMILEY_SAD_FACE}%b)"
}

smiley_remote_host_info() {
  if [[ -n "$SSH_CLIENT" ]]; then
    print "%{$fg_bold[red]%}[%{$fg_no_bold[cyan]%}%B${HOST}%b%{$fg_bold[red]%}]%{$reset_color%} "
  fi
}

PROMPT='$(smiley_remote_host_info)$(smiley_face) %{$reset_color%}'
RPROMPT='%B%~%b$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}⭠ %{$fg_no_bold[cyan]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$reset_color%}"
