export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/ach/Library/Android/sdk/platform-tools/
export BASH_SILENCE_DEPRECATION_WARNING=1
if [ -f ~/.bashrc ] ; then
	echo "sourcing bashrc..."
	source ~/.bashrc
fi

##
# Your previous /Users/ach/.bash_profile file was backed up as /Users/ach/.bash_profile.macports-saved_2024-03-21_at_15:36:58
##

# MacPorts Installer addition on 2024-03-21_at_15:36:58: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ach/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ach/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ach/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ach/Downloads/google-cloud-sdk/completion.bash.inc'; fi

source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
#chruby ruby-3.3.1


# Added by Toolbox App
export PATH="$PATH:/Users/ach/Library/Application Support/JetBrains/Toolbox/scripts"

