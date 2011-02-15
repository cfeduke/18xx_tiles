$VERBOSE=false
begin
  require 'turn'
rescue LoadError
  puts 'Install the Turn gem for prettier test output.'
end

begin
  require 'facets'
rescue LoadError
  puts 'Install the Facets gem for colorized test output.'
end
$VERBOSE=true