git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
curl -Lks http://bit.do/cfg-init | /bin/bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config remote add origin git@github.com:freedragonlxl/dotfile.git
##fisrt
config push -u origin master
##then
config push

url: https://www.atlassian.com/git/tutorials/dotfiles
