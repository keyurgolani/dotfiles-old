alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias ls='ls -A'
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -lA'                       	# Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Enable aliases to be sudo’ed
# alias sudo="sudo "

# Shortcuts
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias g="git"
alias v="vim"
# alias gh="github"
# alias rm="trash"
alias x+="chmod +x"
# alias -- +x="chmod +x"

# Easier navigation: .., ..., ~ and -
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias -- -="cd -"

# mv, rm, cp, gunzip, clear, reset
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
# alias ungz="gunzip -k"
alias c='clear'
alias cc='reset'

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

alias cask='brew cask'
alias where=which

# Vagrant aliases
# alias vag='vagrant'
# alias vagup='vagrant up'
# alias vagdestroy='vagrant destroy'
# alias vagssh='vagrant ssh'
# alias vaghalt='vagrant halt'

# Be nice
# alias htop='sudo htop'	# Needs htop app installed
alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

#
# Time to upgrade `ls`
#

# Use coreutils `ls` if possible
hash gls >/dev/null 2>&1 || alias gls="ls"

# Always use color output for `ls`
# Detect which `ls` flavor is in use
if gls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

export CLICOLOR_FORCE=1

# List only directories
alias lsd='gls -l | grep "^d"'

# `cat` with beautiful colors. requires Pygments installed.
# sudo easy_install -U Pygments
# alias c='pygmentize -O style=monokai -f console256 -g'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias localip="ipconfig getifaddr en0"
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"

#
# GIT STUFF
#

# # List git branches on the local machine sorted by recent updates, adding a star to remote tracking branches
# function git_list_branches() {
#   RED="\e[91m";
#   for branch in $(git branch | sed s/^..//); do
#     time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
#     # Add a red star to mark branches that are tracking something upstream
#     tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED★"; fi);
#     printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
#   done | sort;
# }

# # Git aliases
# # More Git tips http://firstaidgit.io/
# alias gss="git status -s"
# alias gp="git push origin HEAD"
# alias gpt="git push origin HEAD && git push --tags"
# alias wip="git commit -m'WIP' . && git push origin HEAD"
# alias grok="ngrok start rem.jsbin-dev.com static.rem.jsbin-dev.com learn.rem.jsbin-dev.com"
# alias gl='git log'
# alias glp5='git log -5 --pretty --oneline' # view your last 5 latest commits each on their own line
# alias glt='git log --all --graph --decorate --oneline --simplify-by-decoration' # pretty branch status
# alias glsw='git log -S' # search the commit history for the word puppy and display matching commits (glsw [word])
# alias gs='git status'
# alias gd='git diff'
# alias gm='git commit -m'
# alias gam='git commit -am'
# alias gb='git branch'
# alias gc='git checkout'
# alias gra='git remote add'
# alias grr='git remote rm'
# alias gbt=git_list_branches
# alias gpu='git pull origin HEAD --prune'
# alias gcl='git clone'
# alias gta='git tag -a -m'
# alias gf='git reflog' # allows you to see every step you have made with git allowing you to retract and reinstate your steps
# alias gap='git add -p' # step through each change, or hunk
# alias gsl='git shortlog -sn' # quickly get a list of contributors and see how many commits each person has
# alias gws='git diff --shortstat "@{0 day ago}"' # how many lines of code you have written today
# alias gwts='git ls-files | xargs wc -l' # count number of lines of code in a git project
# alias ggmp='git checkout -' # jump back to to your last branch
# alias gst='git stash' # stash git changes and put them into your list
# alias gdtp='git stash pop' # bring back your changes, but it removes them from your stash
# alias gchp='git cherry-pick' # cherry pick the committed code in your own branch (gchp [hash])
# alias gcln='git clean -xfd' # remove untracked files

# # Undo a `git push`
# alias undopush="git push -f origin HEAD^:master"

# # `cd` to Git repo root
# alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# # Gist
# alias gist-paste="gist --private --copy --paste --filename"  # gist-paste filename.ext -- create private Gist from the clipboard contents
# alias gist-file="gist --private --copy"  # gist-file filename.ext -- create private Gist from a file

# Networking. IP address, dig, DNS
alias dig="dig +nocmd any +multiline +noall +answer"

# View HTTP traffic
# alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"	# Needs ngrep installed
# alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""	# Needs tcpdump installed

# Download file and save it with filename of remote file
alias get="curl -O -L"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Disc utils
alias diskspace_report="df -P -kHl"
# alias free_diskspace_report="diskspace_report"

# File size
alias size="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs & the useless sleepimage to improve shell startup speed
# alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo grm -rf $HOME/.Trash; sudo rm -rtv /private/var/log/asl/*.asl; sudo rm /private/var/vm/sleepimage"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/hide all desktop icons (useful when presenting)
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-rdoc --no-ri'

# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'