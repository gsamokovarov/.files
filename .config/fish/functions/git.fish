# Use hub for git with a twist -- if the first argument is an existing branch
# then switch to it.
function git
  switch (count $argv)
    case 1
      set -l target_branch $argv[1]

      # For some reason, the __fish_git_branches and __fish_git_tags functions
      # are not defined during the first run of the git function. Just inline
      # them for now.
      set -l available_branches (command git branch --no-color -a ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///')
      set -l available_tags (command git tag ^/dev/null)

      if contains $target_branch $available_branches $available_tags
        command git checkout $target_branch
        return 0
      end
  end
  hub $argv
end

# Autocomplete the tags and branches as commands. The git function lets you do
# that and having completion for it is pretty cool.
complete -f -c git -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -a '(__fish_git_tags)' --description 'Tag'
