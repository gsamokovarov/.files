IRB.conf[:PROMPT_MODE] = :SIMPLE

# When I open the IRB, I probably wanna have those around.
require 'pathname'
require 'fileutils'
require 'open-uri'

begin
  require 'active_support/all'
rescue LoadError
  # Well, I tried.
end
