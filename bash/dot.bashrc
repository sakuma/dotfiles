
# Terminal View

PS1='\h:\w \u $ '
PS2='> '



### PATH

export PATH=/usr/local/bin:$PATH
# Ports用
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# export PATH=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin:$PATH


export MANPATH=/opt/local/share/man:$MANPATH

# Scheme
SCHEME_LIBRARY_PATH="/usr/local/lib/slib/"
export SCHEME_LIBRARY_PATH

# SBCL
PATH=/opt/sbcl/sbcl-1.0.29/bin:$PATH
export SBCL_HOME=/opt/sbcl/sbcl-1.0.29/lib/sbcl

# PATH=/opt/sbcl/sbcl-1.0.33/bin:$PATH
# export SBCL_HOME=/opt/sbcl/sbcl-1.0.33/lib/sbcl

## Ruby
# Gems
export PATH=$HOME/.gem/ruby/1.8/bin:$PATH
#export PATH=/Library/Ruby/Gems/1.8/gems/ZenTest-4.2.1/bin:$PATH
export GEM_HOME=$HOME/.gem/ruby/1.8

### require 'rubygems' を省略できる
# export RUBYOPT=rubygems

#export RUBYLIB=/opt/local/lib/ruby/gems/1.8/gems/ruby-graphviz-0.9.0/lib/:$RUBYLIB
#export RUBYPATH=/opt/local/lib/ruby/gems/1.8/gems:$RUBYPATH
#export RUBYPATH=/opt/local/lib/ruby/vendor_ruby/1.8
#/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8/gems:$PATH

# Short Cuts
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
# alias spec='spec -c'



