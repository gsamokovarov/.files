local smiley_or_sad_face="%(?:%{$fg_bold[yellow]%}%B☺ %b:%{$fg_bold[red]%}%B☹ %b)"

local remote_host_info=''
if [[ -n "$SSH_CLIENT" ]]; then
  remote_host_info="%{$fg_bold[red]%}[%{$fg_no_bold[cyan]%}%B${HOST}%b%{$fg_bold[red]%}]%{$reset_color%} "
fi

PROMPT='${remote_host_info}${smiley_or_sad_face} %{$reset_color%}'
RPROMPT='%B%~%b$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}[%{$fg_no_bold[cyan]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[red]%}]%{$reset_color%}"

#  vim: set ft=zsh ts=4 sw=4 et:
