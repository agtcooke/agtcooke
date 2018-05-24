# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Aliases
alias ls="ls -l --color"
alias clear='printf "\033c"'
alias cls="clear"
alias kp8080="~/kill_port.bat 8080"
alias kp="~/kill_port.bat"

# PROMPT for git

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[0;36m\]"
MAGENTA="\[\033[0;35m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"
 
function parse_git_branch {
 
git rev-parse --git-dir &> /dev/null
behind=$(git log --oneline HEAD..origin 2> /dev/null | wc -l)
ahead=$(git log --oneline origin..HEAD 2> /dev/null | wc -l)
git_status="$(git status 2> /dev/null)"
branch_pattern="^On branch ([^${IFS}]*)"
remote_pattern="Your branch is (.*) of"
diverge_pattern="Your branch and (.*) have diverged"
rebase_pattern="You are currently rebasing branch '(.*)' on '(.*)'"
if [[ ! ${git_status}} =~ "working directory clean" ]]; then
  if [[ ${git_status} =~ ${rebase_pattern} ]]; then
    state="${LIGHT_GRAY} ${LIGHT_RED}rebasing${LIGHT_GRAY}"
  elif [[ ${git_status}} =~ "Changes not staged for commit" ]]; then
    state="${RED}\xE2\x99\xA6"
  elif [[ ${git_status}} =~ "Changes to be committed" ]]; then
    state="${YELLOW}\xE2\x99\xA6"
  fi
else
  state="${GREEN}\xE2\x99\xA6"
fi
# add an else if or two here if you want to get more specific
if [[ ${git_status} =~ ${remote_pattern} ]]; then
  if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
    remote="${YELLOW}^"
  else
    remote="${YELLOW}v"
  fi
fi
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
  remote="${YELLOW}^v"
fi
if [[ ${git_status} =~ ${branch_pattern} || ${git_status} =~ ${rebase_pattern} ]]; then
  branch=${BASH_REMATCH[1]}
  ahead_color=${LIGHT_GRAY}
  behind_color=${LIGHT_GRAY}
  if [[ ${ahead} > 0 ]]; then
    ahead_color=${MAGENTA}
  fi
  if [[ ${behind} > 0 ]]; then
    behind_color=${RED}
  fi
  echo -e " (${branch} ${behind_color}${behind}${LIGHT_GRAY}|${ahead_color}${ahead}${GREEN})${remote}${state}"
fi
}
 
function prompt_func() {
previous_return_value=$?;
# prompt="${TITLEBAR}$BLUE[$RED\w$GREEN$(__git_ps1)$YELLOW$(git_dirty_flag)$BLUE]$COLOR_NONE "
prompt="${TITLEBAR}${LIGHT_GRAY}[${YELLOW}\w${GREEN}$(parse_git_branch)${LIGHT_GRAY}]${COLOR_NONE} "
if test $previous_return_value -eq 0
then
  PS1="${prompt}: "
fi
}
 
PROMPT_COMMAND=prompt_func

SSH_ENV=$HOME/.ssh/environment
  
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    eval `ssh-agent -s` 
    ssh-add ~/.ssh/*_rsa
}
  
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
	 ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
else
    start_agent;
fi