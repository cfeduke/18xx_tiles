require 'rubygems'
require 'logger'
require 'rake/testtask'

task :default => 'test:unit'

namespace :test do
  desc "Run basic tests"
  Rake::TestTask.new("unit") { |t|
    t.pattern = 'test/*_test.rb'
    t.verbose = true
    t.warning = true
  }
  
end



