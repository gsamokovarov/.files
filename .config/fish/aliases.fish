# Dot aliases.
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

# Rage quit everywhere.
alias Q exit

# Sudo apt-get as it is always what you want.
alias apt-get "sudo apt-get"

# I never learned how to type freakin' killall.
alias kilalll killall
alias kilall killall

# Some systems may not be happy with the $TERM of screen-256colors, so be sane.
alias ssh "env TERM=xterm command ssh"

# I use vim a lot, so shortcut it to just v. On top of that, don't bother with
# vi if I mistype it and open multiple files in tabs.
abbr -a v=vim
abbr -a vi=vim

# Shortcuts for rake, grunt, make, docker and git.
abbr -a r=rake
abbr -a u=grunt
abbr -a m=make
abbr -a d=docker
abbr -a g=git

# Git subcommands shortcuts.
abbr -a gc='git commit'
abbr -a gco='git commit'
abbr -a gcp='git cherry-pick'
abbr -a gd='git diff'
abbr -a gl='git log'
abbr -a gs='git state'
abbr -a ga='git commit --amend'

# Yes, that happened today. Age, you know...
alias mdkir mkdir

# Bundle shortcuts.
abbr -a b='bundle'
abbr -a be='bundle exec'
abbr -a bu='bundle update'
abbr -a ber='bundle exec rake'
abbr -a bra='bundle exec rails'
abbr -a bo='bundle open'
abbr -a bi='bundle install'

# Just don't, OK?
abbr -a vag vagrant
abbr -a vup vagrant up
abbr -a vpr vagrant provision

# Use hub for git with a twist -- if the first argument is an existing branch
# then switch to it.
function git
  switch (count $argv)
    case 1
      set -l target_branch $argv[1]

      # For some reason, the __fish_git_branches and __fish_git_tags functions
      # are not defined during the first run of the git function. Just inline
      # them for now.
      set -l available_branches (command git branch --no-color -a ^/dev/null | grep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///')
      set -l available_tags (command git tag ^/dev/null)

      if contains $target_branch $available_branches $available_tags
        command git checkout $target_branch
        return 0
      end
  end
  hub $argv
end

function vim
  if which nvim >/dev/null
    command nvim -p $argv
  else
    command vim -p $argv
  end
end

# Autocomplete the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -a '(__fish_git_tags)' --description 'Tag'
