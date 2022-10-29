# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
eval $(thefuck --alias)
alias updateAll='~/scripts/updateAllAndClean.sh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
# not my city, I modified this before putting in a repo so change it back
alias weather='curl wttr.in/boston'
alias pocketUpdates='node ~/code/PERSONAL_GL/pocket-update-notifier/index.mjs'