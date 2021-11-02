function darkmode --argument preference
  set -l background "light"
  if test -z $preference
    defaults read -g AppleInterfaceStyle 2>/dev/null
    if test $status -eq 0
      set background "dark"
    end
  else
    set background $preference
  end

  set -x BACKGROUND $background

  echo $BACKGROUND > ~/.colorscheme

  set -l kitty_socket unix:(echo /tmp/mykitty-*)

  # Change the kitty colorscheme for every window.
  kitty @ --to $kitty_socket set-colors --all --configured ~/.config/kitty/gruvbox_$BACKGROUND.conf

  # Change the neovim background.
  echo '
    begin
      require "neovim"
    rescue LoadError
      abort "The neovim gem is not found, install it with `gem install neovim`"
    end

    socket = ENV.fetch("NVIM_LISTEN_ADDRESS")
    background = ENV.fetch("BACKGROUND")

    begin
      client = Neovim.attach_unix socket
      client.command "set background=#{background}"
    rescue Errno::ENOENT
      # Ignore the error if no neovim is running.
    end
  ' | ruby
end
