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
fzf extra cmd
$(brew --prefix)/opt/fzf/install

//pip 在线转移
pip freeze >dependency.txt
pip install -r dependency.txt
//pip 离线安装
pip download -r dependency.txt -d ./mylibs/
pip install --no-index --find-links=./mylibs/
https://blog.csdn.net/huashao0602/article/details/97617003

tmux 插件启东条件，手动
cd ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm

每次更新xcode，clang版本就会更新，会影响ycm_extra_conf.py文件的自动补全配置
