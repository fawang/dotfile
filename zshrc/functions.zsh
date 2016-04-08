
####################
# functions
####################

# ------------------------------
#  File & Folder Management
# ------------------------------

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash: Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql: Opens any file in MacOS Quicklook Preview

#   lr:  Full Recursive Directory Listing 
#   (should really be done by "tree" command)
#   ------------------------------------------
# alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------

mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

zipf () { zip -r "$1".zip "$1" ; }          # zipf: To create a ZIP archive of a folder

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
    else
        echo "'$1' is not a valid file"
            fi
}


alias make1mb='mkfile 1m ./1MB.dat'         # make1mb: Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb: Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb: Creates a file of 10mb size (all zeros)

# print available colors and their numbers
function colours() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}m colour${i}"
        if (( $i % 5 == 0 )); then
            printf "\n"
        else
            printf "\t"
        fi
    done
}

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

function hist() {
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# find shorthand
function f() {
    find . -name "$1"
}

function ng-stop() {
    sudo launchctl stop homebrew.mxcl.nginx
}

function ng-start() {
    sudo launchctl start homebrew.mxcl.nginx
}
function ng-restart() {
     sudo launchctl start homebrew.mxcl.nginx
}


# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# take this repo and copy it to somewhere else minus the .git stuff.
function gitexport(){
    mkdir -p "$1"
    git archive master | tar -x -C "$1"
}

# get gzipped size
function gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# All the dig info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
    echo # newline
}

# Extract archives - use: extract <file>
# Credits to http://dotfiles.org/~pseup/.bashrc
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) rar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function scpp() {
    scp "$1" nicknisi@nicknisi.com:/var/www/nicknisi.com/public_html/share;
    echo "http://nicknisi.com/share/$1" | pbcopy;
    echo "Copied to clipboard: http://nicknisi.com/share/$1"
}

# syntax highlight the contents of a file or the clipboard and place the result on the clipboard
function hl() {
    if [ -z "$3" ]; then
        src=$( pbpaste )
    else
        src=$( cat $3 )
    fi

    if [ -z "$2" ]; then
        style="moria"
    else
        style="$2"
    fi

    echo $src | highlight -O rtf --syntax $1 --font Inconsoloata --style $style --line-number --font-size 24 | pbcopy
}

# set the background color to light
function light() {
    export BACKGROUND="light" && reload!
}

function dark() {
    export BACKGROUND="dark" && reload!
}

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
# cdf () {
#     currFolderPath=$( /usr/bin/osascript <<EOT
#             tell application "Finder"
#             try
#             set currFolder to (folder of the front window as alias)
#             on error
#             set currFolder to (path to desktop folder as alias)
#             end try
#             POSIX path of currFolder
#             end tell
#             EOT
#             )
#         echo "cd to \"$currFolderPath\""
#         cd "$currFolderPath"
# }

