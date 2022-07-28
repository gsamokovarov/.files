# Dot aliases.
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

# Exa is the new ls, yo!
alias ls exa

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

# Isn't hive a much better name for the binary?
alias hive hivemind

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
abbr -a gl git short
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

alias kubedemo "kubectl --kubeconfig=/Users/genadi/.kube/demo_cluster.yml"
alias kubestaging "kubectl --kubeconfig=/Users/genadi/.kube/staging_cluster.yml"
alias kubeproduction "kubectl --kubeconfig=/Users/genadi/.kube/production_cluster.yml"
alias kubeinfrastructure "kubectl --kubeconfig=/Users/genadi/.kube/infrastructure_cluster.yml"

# Faster bundle exec if a local `./bin/$stub` is available.
function be
  set -l stub $argv[1]
  set -l arguments $argv[2..-1]

  if test -f "./bin/$stub"
    ./bin/$stub $arguments
  else
    bundle exec $argv
  end
end

function __git_magic_available_branches
  command git branch --no-color -a 2>/dev/null | grep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///'
end

function __git_magic_available_tags
  command git tag 2>/dev/null
end

# Use hub for git with a twist -- if the first argument is an existing branch
# then switch to it.
function git
  switch (count $argv)
    case 0
      command git status
      return $status
    case 1
      set -l target_branch $argv[1]
      set -l available_branches (__git_magic_available_branches)
      set -l available_tags (__git_magic_available_tags)

      if contains $target_branch $available_branches $available_tags
        command git switch --guess $target_branch
        return 0
      end
  end

  switch $argv[1]
    case "+"
      command git add $argv[2..]
      return $status
    case "-"
      command git rm $argv[2..]
      return $status
    case "]"
      command git push $argv[2..]
      return $status
    case "["
      command git pull $argv[2..]
      return $status
  end

  hub $argv
end

function vim
  SHELL=/bin/bash command nvim -p $argv 2>/dev/null
end

# Autocomplete the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__git_magic_available_branches)' --description 'Branch'
complete -f -c git -a '(__git_magic_available_tags)' --description 'Tag'
