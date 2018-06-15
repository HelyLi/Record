# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/hely.lixiong/Cocos2dx/cocos2d-x-3.13.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/hely.lixiong/Cocos2dx
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/hely.lixiong/Cocos2dx/cocos2d-x-3.13.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/hely.lixiong/Android/android-ndk-r10e
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/hely.lixiong/Android/android-sdk-macosx
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.7/bin
export PATH=$ANT_ROOT:$PATH

export QUICK_V3_ROOT=`cat ~/.QUICK_V3_ROOT`

# add cocos2d-x related lua files into LUA_PATH
if ! [[ -z "$QUICK_V3_ROOT" ]]; then
 export LUA_PATH="${QUICK_V3_ROOT}/quick/framework/?.lua;${LUA_PATH}"
fi

alias cls='clear'
alias py='python'
alias ll='ls -l'
alias la='ls -a'
alias vi='mvim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=vi   # 在命令行直接输入后缀为 html 的文件名，会在 vim 中打开,如果想用TextMate打开可以将vi改成mate
alias -s rb=vi     # 在命令行直接输入 ruby 文件，会在 vim 中打开
alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s cpp=vi
alias -s lua=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'  #表示自动解压后缀为 gz 的压缩包。
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

#autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export HOMEBREW_GITHUB_API_TOKEN="32506886a73986073ed4f18bcd47c177b4d68b6c"

export GIT_EDITOR=mvim
export PATH="/usr/local/opt/telnet/bin:$PATH"
#alias ssh-to-qzmj='ssh -p 2050 lixiong@sshs1.gqp01.com'

alias qu='cd /Users/hely.lixiong/Cocos2dx/svn/qzmj/trunk/design/UI'
alias ql='cd /Users/hely.lixiong/Cocos2dx/svn/qzmj/trunk/lua-client'
alias qa='cd /Users/hely.lixiong/Cocos2dx/svn/qzmj/trunk/lua-client/majiang/frameworks/runtime-src/proj.android'
alias qp='cd /Users/hely.lixiong/Cocos2dx/svn/qzmj/trunk/lua-client/python_patch_tools'

alias nu='cd /Users/hely.lixiong/Cocos2dx/svn/ndmj-n/trunk/design/UI/QzHDTexture'
alias nl='cd /Users/hely.lixiong/Cocos2dx/svn/ndmj-n/trunk/lua-client'
alias na='cd /Users/hely.lixiong/Cocos2dx/svn/ndmj-n/trunk/lua-client/majiang/frameworks/runtime-src/proj.android'
alias np='cd /Users/hely.lixiong/Cocos2dx/svn/ndmj-n/trunk/lua-client/python_patch_tools'

alias fu='cd /Users/hely.lixiong/Cocos2dx/svn/fzmj/trunk/design/UI'
alias fl='cd /Users/hely.lixiong/Cocos2dx/svn/fzmj/trunk/lua-client'
alias fa='cd /Users/hely.lixiong/Cocos2dx/svn/fzmj/trunk/lua-client/frameworks/runtime-src/proj.android'
alias fp='cd /Users/hely.lixiong/Cocos2dx/svn/fzmj/trunk/lua-client/hot-update/python_patch_tools'

alias zu='cd /Users/hely.lixiong/Cocos2dx/svn/zzmj/trunk/design/UI/QzHDTexture'
alias zl='cd /Users/hely.lixiong/Cocos2dx/svn/zzmj/trunk/lua-client'
alias za='cd /Users/hely.lixiong/Cocos2dx/svn/zzmj/trunk/lua-client/majiang/frameworks/runtime-src/proj.android'
alias zp='cd /Users/hely.lixiong/Cocos2dx/svn/zzmj/trunk/lua-client/python_patch_tools'

alias pu='cd /Users/hely.lixiong/Cocos2dx/svn/npmj/trunk/design/UI/QzHDTexture'
alias pl='cd /Users/hely.lixiong/Cocos2dx/svn/npmj/trunk/lua-client'
alias pa='cd /Users/hely.lixiong/Cocos2dx/svn/npmj/trunk/lua-client/majiang/frameworks/runtime-src/proj.android'
alias pp='cd /Users/hely.lixiong/Cocos2dx/svn/npmj/trunk/lua-client/python_patch_tools'
