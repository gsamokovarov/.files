IRB.conf[:PROMPT_MODE] = :SIMPLE

# When I open the IRB, I probably wanna have those around.
require 'pathname'
require 'fileutils'

begin
  require 'active_support/all'
rescue LoadError
  # Well, I tried.
end
