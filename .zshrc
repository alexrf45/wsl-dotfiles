#zshrc config
# Author: Sean Fontaine
# Email: alex_r0land@pm.me

#history config
HISTFILE=~/.history
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob

#turn off beep 
unsetopt beep
#vi key bindings
bindkey -v

#source aliases and env
source "$HOME/.zprofile"
source "$HOME/.zsh/aliases.zsh"
fpath=(/tmp/zsh-completions/src $fpath)

#displays saying in every new prompt
figlet r0land | lolcat

#persistant ssh agent
eval $(ssh-agent) &> /dev/null

ssh-add ~/.ssh/windev &> /dev/null
ssh-add ~/.ssh/homelab &> /dev/null
ssh-add ~/.ssh/homeadm &> /dev/null
#history log function
    precmd() { eval 'if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history -f)" >> ~/.logs/zsh-history-$(date "+%Y-%m-%d").log; fi' }

alias clear-history='cp $HOME/.history $HOME/dev-bckup/arch-history/.history_backup && echo "" > $HOME/.r0land_history'

alias hist-backup='cp -r ~/.logs/* ~/dev-bckup/arch-history/'

#miniplug zsh
source "$HOME/.zsh/plugins/miniplug.zsh"


# Define a plugin
miniplug plugin 'zsh-users/zsh-syntax-highlighting'
miniplug plugin 'zsh-users/zsh-autosuggestions'
miniplug plugin 'jameshgrn/zshnotes'

# Define a theme
miniplug theme 'dracula/zsh'
# Source plugins
miniplug load

#bash-completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

aws () {
  docker run -it --rm \
    --net=host \
    -v `pwd`:/cfg -v ~/.aws:/home/awsuser/.aws \
    -e AWS_REGION=$AWS_REGION \
    -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
    -e AWS_PAGER=$AWS_PAGER \
    -e AWS_CLI_AUTO_PROMPT=$AWS_CLI_AUTO_PROMPT \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    richarvey/awscli:latest "$@";
}

terraform () {
docker run -it --rm \
    --net=host \
    -v `pwd`:/data \
    -w /data \
    -e CLOUDFLARE_EMAIL=$CLOUDFLARE_EMAIL \
    -e CLOUDFLARE_API_TOKEN=$CLOUDFLARE_API_TOKEN \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    hashicorp/terraform:1.4.6 "$@";
}


# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
