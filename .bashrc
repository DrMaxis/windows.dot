source /usr/lib/git-core/git-sh-prompt
export PS1="┌─[\`if [ \$? = 0 ]; then echo \[\e[32m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`]─\[\e[01;49;39m\]\$(__git_ps1 '──[⌥ %s]──')\[\e[00m\][\[\e[1;49;34m\]\w\[\]\e[00m]\]\n└───▶ "
alias dotfiles='/usr/bin/git --git-dir=/home/user/.dotfiles/ --work-tree=/home/user'
export GIT_EDITOR=nvim
export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim
