source /usr/lib/git-core/git-sh-prompt
export PS1="┌─[\`if [ \$? = 0 ]; then echo \[\e[32m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`]─\[\e[01;49;39m\]\$(__git_ps1 '──[⌥ %s]──')\[\e[00m\][\[\e[1;49;34m\]\w\[\]\e[00m]\]\n└───▶ "
alias dotfiles='/usr/bin/git --git-dir=/home/user/.dotfiles/ --work-tree=/home/user'
export GIT_EDITOR=nvim
export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim

# add Pulumi to the PATH
export PATH=$PATH:/home/user/.pulumi/bin
export PULUMI_CONFIG_PASSPHRASE="bazinga"


# Extras
function cd {
    builtin cd "$@"
    pwd > ~/.last_dir
}

function auto_goto_dir {
    if [ -f ~/.last_dir ]; then
        builtin cd -P "$(cat ~/.last_dir)" 2>/dev/null || cd "${HOME}"
        return 0
    fi
}
auto_goto_dir

# To audo cd when you type just a dirctory
shopt -s autocd


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
