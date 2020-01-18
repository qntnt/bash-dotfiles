if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:~/bin
export PATH="$PATH:~/flutter/bin"

export ANDROID_SDK_ROOT="/Volumes/Elements/Android/sdk/"
export ANDROID_HOME=$ANDROID_SDK_ROOT

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/quentintopper/google-cloud-sdk/path.bash.inc' ]; then . '/Users/quentintopper/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/quentintopper/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/quentintopper/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"
