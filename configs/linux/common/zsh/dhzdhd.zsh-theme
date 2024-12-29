function prompt_char() {
	if [ $UID -eq 0 ]; then echo '#'; else echo 'λ'; fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}✓%{$reset_color%}"

export PROMPT='%F{cyan}%n%f:%F{blue}%~%f %F{green}$(git_prompt_info)%f
%F{yellow}$(prompt_char)%f '