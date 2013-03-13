# The smiley faces in Ubuntu Mono or Inconsolata are displayed in the width of
# two characters. That's why I keep a space after them, so they render nicely
# on my terminal. Feel free to change that for you fonts with exporting your
# own smiley faces with the variables below.
export SMILEY_HAPPY_FACE="☺ "
export SMILEY_SAD_FACE="☹ "

local smiley_or_sad_face="%(?:%{$fg_bold[yellow]%}%B${SMILEY_HAPPY_FACE}%b:%{$fg_bold[red]%}%B${SMILEY_SAD_FACE}%b)"
local remote_host_info=''
if [[ -n "$SSH_CLIENT" ]]; then
  remote_host_info="%{$fg_bold[red]%}[%{$fg_no_bold[cyan]%}%B${HOST}%b%{$fg_bold[red]%}]%{$reset_color%} "
fi

PROMPT='${remote_host_info}${smiley_or_sad_face} %{$reset_color%}'
RPROMPT='%B%~%b$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}[%{$fg_no_bold[cyan]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[red]%}]%{$reset_color%}"
