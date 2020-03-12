# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#lanio is a very good boy
export PATH="$PATH:$HOME/.rvm/bin"
#pyenv fix无效 pyenv global 3.7.5
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export TERM=xterm-256color
# My useful aliases
alias vim='nvim'
alias vi='nvim'
alias VI='nvim'
alias VIM='nvim'
alias Vi='nvim'
alias vI='nvim'
alias Vim='nvim'
alias VIm='nvim'
alias viM='nvim'
alias ViM='nvim'
alias vIm='nvim'
#alias en="trans -e google -b :en"
#alias zh="trans -e google -b :zh-CN"
alias en="trans -b :en"
alias zh="trans -b :zh-CN"
alias rm="trash"
alias ldu="ls -1 | xargs du -h -d 0 2>/dev/null"
alias music="you-get -o /Users/freedragon/Music/Chinese -O "
alias movies="you-get -o /Users/freedragon/Movies -O "
ZSH_THEME="agnoster"
plugins=(zsh-autosuggestions git)
source /usr/local/Cellar/zsh-syntax-highlighting/0.6.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LC_ALL=en_US.UTF-8
export PATH=${PATH}:/Users/freedragon/Library/Android/sdk/platform-tools
export PATH=${PATH}:/Users/freedragon/Library/Android/sdk/tools
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function proxy_off(){
	unset http_proxy
    unset https_proxy
    ps -ef | grep V2Milk | grep -v grep | awk '{print $2}' | xargs kill
	echo -e "已关闭代理"
}

function proxy_on() {
	open /Applications/弄子里.app
	export no_proxy="localhost,127.0.0.1,localaddress.localdomain.com"
    export http_proxy="http://127.0.0.1:8001"
    export https_proxy=$http_proxy
    echo -e "已开启代理"
}

#if brew list | grep coreutils > /dev/null ; then 
#	PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH" 
#	alias ls='ls -F --show-control-chars --color=auto' 
#	eval 'gdircolors -b $HOME/.dir_colors'
#fi

##afplay##start##
function m() {
    music_by_keyword $1 &
}

function music_by_keyword() {
    m_path=~/Music/Chinese/
    keyword="."                                                         # default: play all the songs
    if [ -n "$1" ]; then                                                # play songs by keyword
        keyword="$1"
    fi

    song_num="$(ls $m_path | grep -i -e $keyword | wc -l)"                   # Total num of qualified songs
    while [ 1 ]
    do
        dummy1=$((RANDOM))
        timestamp=$(date +%s)
        dummy=$(($dummy1*$timestamp))
        song_index=$(($dummy1%$song_num+1))                              # Generate a random song index
        song="$(ls $m_path | grep -i -e $keyword | sed -n "$song_index"p)"   # Get the name of the qualified song
        echo -e "$song"
        afplay "$m_path$song"
        wait
    done
}

function n() {  # next song
    pid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $2}')"
    kill -INT $pid
}

function mm() { # terminate afplay
    pid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $2}')"
    ppid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $3}')"
    kill -INT $ppid && kill -INT $pid
}

function ms() { # music stop
    ppid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $3}')"
    pid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $2}')"
    kill -TSTP $pid && kill -TSTP $ppid
}

function mc() { # music continue
    ppid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $3}')"
    pid="$(ps -ef | grep afplay | grep -v grep | head -1 | awk '{print $2}')"
    kill -CONT $pid && kill -CONT $ppid
}

function over(){ #over vpn
#	ps -ef | grep nsurlsessiond | grep -v grep | awk '{print $2}' | xargs kill
	ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill
#	ps -ef | grep nsurlstoraged | grep -v grep | awk '{print $2}' | xargs kill
}

##afplay##end##
alias config='/usr/bin/git --git-dir=/Users/freedragon/.cfg/ --work-tree=/Users/freedragon'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
