function fish_user_key_bindings
  # Bring a background process to the foreground witn Ctrl-X. Ctrl-Z cannot be
  # bound due to https://www.mail-archive.com/fish-users@lists.sourceforge.net/msg03480.html
  bind \cx 'fg; commandline -f repaint'
end

fzf_key_bindings
