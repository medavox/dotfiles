
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

alias diff='diff --color=auto'
alias grep='grep --exclude-dir=build --exclude-dir=doc --exclude-dir=.gradle --exclude-dir=.git --exclude-dir=build --exclude-dir=.idea --exclude=*.html --exclude=*.iml --color=auto'
alias l='ls -hAo'
#useful command for cloning unapproved pull request;
#from https://stackoverflow.com/q/14947789/#comment74877951_14969986
alias pr="!f() { git fetch $1 pull/$2/head:pull_$2; git co pull_$2; }; f"
alias ziptX="ssh -XC -c blowfish-cbc"
alias 7z7z="7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on"
alias mount=mount | column -t
alias gpom="git push origin master"
alias gs="git status"
alias gd="git diff"
alias gau='git add -u'
alias gcam="git commit -am "
alias gcm='git commit -m'
alias sz='du -ahd 1 | sort -h'
alias ghid='git rev-parse --short HEAD'
alias countfiles='find . -type f | wc -l'
alias gwad='./gradlew assembleDebug'
alias gcr='git commit -c HEAD --reset-author' #reuse last commit message, but set a new timestamp etc

cda () {
    #keep moving up a dir,
    # until the current dir contains a file exactly named .git
    myOLDPWD=$(pwd)
    while [ -z $(ls -A | egrep ^\\.git$) ] ; do
        cd ..
    done
    OLDPWD=$myOLDPWD
}

#alias caja='caja --no-desktop'
alias pv='pv -tra'
#find, with a useful regex standard and 'permission denied' messages hidden by default
# takes one argument of a regex in double quotes
fynd () {
    find -regextype posix-extended -iregex $1 2> /dev/null
}


# list the number of occurrences of a given string, in files where it occurs
# results are sorted descending by number of occurrences, so the last one has the most
# supports passing extra arguments to the grep search used, such as -i ignore case
occurrencesOf() {
    grep -Irc $1 $2 | grep -v :0 | sort -n -t : -k 2 | column -t -s :
}

