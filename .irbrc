# frozen_string_literal: true

IRB.conf[:PROMPT_MODE] = :SIMPLE

# When I open the IRB, I probably wanna have those around.
require 'pathname'
require 'fileutils'
require 'open-uri'

# When I open IRB inside of a gem, I want its lib folder in load paths.
$LOAD_PATH << './lib'

begin
  # When inside a gem, try to require it.
  require Pathname.pwd.basename.to_s
rescue LoadError
  # Maybe we are not inside of a gem. That's fine.
end

def h(value)
  value.to_s(16)
end

def b(value)
  value.to_s(2)
end
