
# ------------------------------ 
# 2. Aliases 
# ------------------------------ 

# reload zsh config
alias reload!='source ~/.zshrc'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Filesystem aliases
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../../"                     # Go back 3 directory levels
alias .4="cd ../../../../"                  # Go back 4 directory levels
alias .5="cd ../../../../../"               # Go back 5 directory levels
alias .6="cd ../../../../../../"            # Go back 6 directory levels

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep -e '^d'"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias rmf="rm -rf"
alias h="history 1000"

alias cp="cp -iv"                           # Preferred 'cp' implementation
alias mv="mv -iv"                           # Preferred 'mv' implementation
alias rm="rm -iv"                           # Preferred 'rm' implementation
alias mkdir="mkdir -pv"                     # Preferred 'mkdir' implementation
alias less="less -FSRXc"                    # Preferred 'less' implementation
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias f="open -a Finder ./"                 # f: Opens current directory in MacOS Finder
alias c='clear'                             # c: Clear terminal display
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles: Count of non-hidden files in current dir
# alias which='type -all'                     # which: Find executables
alias showpath='echo -e ${PATH//:/\\n}'         # path:  Echo all executable Paths
# alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty: Restore terminal settings when screwed up
# alias cic='set completion-ignore-case On'   # cic: Make tab-completion case-insensitive
alias DT='tee ~/Desktop/terminalOut.txt'    # DT: Pipe content to file on MacOS Desktop
alias showip='ifconfig |grep inet'
alias publicip='curl ifconfig.me'


# Vim
# alias vim='mvim'

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias canary="/Applications/Google\\ Chrome\\ Canary.app/Contents/MacOS/Google\\ Chrome\\ Canary"

