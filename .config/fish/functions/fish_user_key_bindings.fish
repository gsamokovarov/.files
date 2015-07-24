function fish_user_key_bindings
  # Search the reverse history with fzf.
  bind \cr 'history | fzf -s; commandline -f repaint'

  # Bring a background process to the foreground witn Ctrl-X. Ctrl-Z cannot be
  # bound due to https://www.mail-archive.com/fish-users@lists.sourceforge.net/msg03480.html
  bind \cx 'fg; commandline -f repaint'
end
