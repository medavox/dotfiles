
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

alias tree='tree -I build'
alias diff='diff --color=auto'
alias grep='ggrep --exclude-dir=build --exclude-dir=doc --exclude-dir=.gradle --exclude-dir=.git --exclude-dir=.idea --exclude=*.html --exclude=*.iml --color=auto'
alias l='gls --color=auto -hAo'
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
alias sz='gdu -ahd 1 | sort -h'
alias ghid='git rev-parse --short HEAD'
alias countfiles='find . -type f | wc -l'
alias gwad='./gradlew assembleDebug'
alias gcr='git commit -c HEAD --reset-author' #reuse last commit message, but set a new timestamp etc
alias sod='GIT_SSH_COMMAND="ssh -i ~/.ssh/medavox -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git -c "user.name=Adam Howard" -c "user.email=medavox2+github@gmail.com" '
alias glns='git log --name-status'
alias replace='python3 /Users/ach/src/replace.py'
alias glut='git ls-files --others --exclude-standard'

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

wipeGradleCache() {
	./gradlew --stop
	cd ~/.gradle
	rm -rf caches
	cd -
}

branches() {
    for x in 1_gc1_api 2a 3_PR_reviews 4 5; do 
        cd $x
        echo $x = $(git branch --show-current)
        cd ..
    done
}