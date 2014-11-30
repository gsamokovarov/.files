IRB.conf[:PROMPT_MODE] = :SIMPLE

# When I open the IRB, I probably wanna have those around.
require 'pathname'
require 'fileutils'
require 'open-uri'

# When I open IRB inside of a gem, I want its lib folder in load paths.
$LOAD_PATH << './lib'

begin
  require 'active_support/all'
rescue LoadError
  # Well, I tried.
end
