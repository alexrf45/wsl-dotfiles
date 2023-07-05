
#ubuntu commands
alias reload='. ~/.zshrc'
alias update='sudo apt-get upgrade -y'
alias i='sudo apt-get install'
alias vim='nvim'
alias tree-overview='tree -D -L 2'

#tmux
alias t='tmux new -f ~/.tmux.conf -s $1'
alias tmux-session='tmuxp load ~/.config/tmuxp/dev.yaml'
alias tmux-r0land-link='tmuxp load ~/.config/tmuxp/r0land-link.yaml'
#networking
alias public='curl wtfismyip.com/text'

#aws-vault
alias awsv='aws-vault exec Administrator'
alias awsv-no-session='aws-vault exec Administrator --no-session'
alias awsv-acct-admin='aws-vault exec account-admin --duration=2h'
alias awsv-acct-admin-no-session='aws-vault exec account-admin --no-session'

#python
alias py='python3'

#ssh

#tor
alias tor='docker run --rm --detach --name tor --publish 9050:9050 tor:test'


#scripts
alias arch-mirror='~/.config/scripts/./arch-mirror.sh'
alias terraform-project='~/.config/scripts/./terraform-skel.sh $1'
alias dockershell='~/.config/scripts/./dockershell.sh'
alias ec2-list='~/.config/scripts/./ec2list.sh'
alias s3-create='python3 ~/.config/scripts/s3.py'
alias aws-services-list='~/.config/scripts/./services.sh'
alias aws-current-cost='~/.config/scripts/awscurrentcost.sh'
alias aws-cost-overall='~/.config/scripts/awscost.sh'
alias tf-project='~/.config/scripts/./terraform-skel.sh'
alias s3-backend-delete='~/.config/scripts/./s3-backend-delete.sh'
alias terraform-tool='cp ~/.config/tools/terraform/* .'
#terraform
alias tf='terraform'
alias tfa='terraform apply'
alias tfv='terraform validate'
alias tfp='terraform plan'
alias tfs='terraform state'
alias tfsls='terraform state list'
alias tfo='terraform output'
alias tfinit='terraform init'
alias tfd='terraform destroy'
alias tff='terraform fmt'

#aws cli aliases
alias ec2-check='aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIP:PublicIpAddress,PrivateIP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Type:InstanceType,Status:State.Name,VpcId:VpcId,Id:InstanceId}" --filters "Name=instance-state-name,Values=running" --output table'
alias s3-list="aws s3api list-buckets | jq -r '.Buckets[].Name'"
alias vpc-check='aws ec2 --output text --query "Vpcs[*].{VpcId:VpcId,Name:Tags[?Key=='Environment'].Value|[0],CidrBlock:CidrBlock}" describe-vpcs'
alias s3-delete='aws s3api delete-bucket --bucket ${BUCKET}'
alias iam-access-id-admin='aws iam get-user --user-name administrator | jq -r ".User | .UserId"'
#cloud-nuke aws
alias aws-nuke='cloud-nuke aws --exclude-resource-type s3 --exclude-resource-type iam --exclude-resource-type secretsmanager --exclude-resource-type dynamodb'
alias aws-nuke-view-us-east-1='cloud-nuke inspect-aws --region us-east-1'

#docker
alias dock='docker'
alias dockimls='docker image ls'
alias dockim='docker image'
alias dockc='docker container'
alias dockps='docker ps'
alias docknt='docker network'


#docker compose
alias dock-up='docker-compose up -d'
alias dock-down='docker-compose down'


alias dev='/usr/bin/git --git-dir=/home/$USER/.cfg/ --work-tree=/home/$USER'
