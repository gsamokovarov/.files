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

# Do it by default. Don't let me think about it.
alias mkdir "mkdir -p"

# Some systems may not be happy with the $TERM of screen-256colors, so be sane.
alias ssh "env TERM=xterm command ssh"

# Let there be colors in cat!
alias cat ccat

# Downloads YouTube videos with ease.
alias yt youtube-dl

# I use vim a lot, so shortcut it to just v. On top of that, don't bother with
# vi if I mistype it and open multiple files in tabs.
abbr -a v vim
abbr -a vi vim

# Shortcuts for common executables.
abbr -a r rails
abbr -a m make
abbr -a d docker
abbr -a g git
abbr -a h heroku

# Rails related shortcuts
abbr -a rt rails test
abbr -a rc rails console
abbr -a rs rails server
abbr -a rials rails
abbr -a riasl rails
abbr -a raisl rails

# Git subcommands shortcuts.
abbr -a gc git commit
abbr -a gco git commit
abbr -a gcp git cherry-pick
abbr -a gd git diff
abbr -a gl git log
abbr -a gs git status
abbr -a ga git commit --amend

abbr -a "g[" git [
abbr -a "g]" git ]
abbr -a "g+" git +
abbr -a "g-" git--

# Yes, that happened today. Age, you know...
alias mdkir mkdir

# Bundle shortcuts.
abbr -a b bundle
abbr -a be bundle exec
abbr -a bu bundle update
abbr -a br bundle exec rails
abbr -a brat bundle exec rails test
abbr -a bo bundle open
abbr -a bi bundle install
abbr -a bam bundle exec middleman

# Make shortcuts.
abbr -a mat make test

# Just don't, OK?
abbr -a vag vagrant
abbr -a vup vagrant up
abbr -a vpr vagrant provision

# Direnv is used quite often around here.
abbr -a da direnv allow

# Use hub for git with a twist -- if the first argument is an existing branch
# then switch to it.
function git
  switch (count $argv)
    case 0
      command git status
      return $status
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
  command nvim -p $argv 2>/dev/null
end

# Autocomplete the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -a '(__fish_git_tags)' --description 'Tag'
