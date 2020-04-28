
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# prevent change ruby version on new terminal tab opening
cd .

# RVM can encounter errors if it's not the last thing in .bash_profile
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to path for scripting (to manage Ruby versions)
export PATH="$GEM_HOME/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*
