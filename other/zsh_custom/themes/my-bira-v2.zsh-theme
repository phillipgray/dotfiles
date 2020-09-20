# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

local rb_version='%{$fg[red]%}$(asdf_ruby_version)%{$reset_color%}'

local py_version='%{$FG[026]%}$(asdf_python_version)%{$reset_color%}'

local nodejs_version='%{$fg[green]%}$(asdf_nodejs_version)%{$reset_color%}'

local git_branch='$(git_prompt_info)%{$reset_color%}'

local postgresql_status='%{$fg[cyan]%}$(postgresql_status)%{$reset_color%}'

local redis_status='%{$FG[009]%}$(redis_status)%{$reset_color%}'

local statuses=$(echo "${user_host} ${current_dir} ${rb_version} ${py_version} ${nodejs_version} ${postgresql_status} ${redis_status} ${git_branch}" | sed -e "s/ \{2,5\}/ /")

PROMPT="╭─${statuses}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔︎ "