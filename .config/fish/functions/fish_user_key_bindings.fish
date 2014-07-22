function fish_user_key_bindings
  # The reverse search in fish works in reverse. You first type what you want to
  # search for, then you press the Up arrow. Rebind it to ^R, so I can remember
  # it better.
  bind \cr history-search-backward

  # Bring a background process to the foreground witn Ctrl-X. Ctrl-Z cannot be
  # bound due to https://www.mail-archive.com/fish-users@lists.sourceforge.net/msg03480.html
  bind \cx 'fg; commandline -f repaint'
end
