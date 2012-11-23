require("fileutils").tap do
  include FileUtils
end

PATTERNS  = %w(* .*)
BLACKLIST = %w(. .. .git .gitmodules .files.png Rakefile README)

task :install do
  Dir[*PATTERNS].each do |file|
    cp_r file, home(file) unless BLACKLIST.include? file
  end
end

# Helpers
# -------

def home(filename)
  File.join ENV['HOME'], filename 
end
