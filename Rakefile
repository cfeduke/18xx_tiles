require 'rubygems'
require 'logger'
require 'rake/testtask'

task :default => 'test:unit'

desc "Deletes the contents of the output folder"
task :clean do
  pwd = `pwd`.chomp("\n")
  %x[rm -rf "#{pwd}/output/*"]
end

namespace :retrieve do
  desc "Retrieve yellow tiles"
  task :yellow do
    
  end
end

namespace :test do
  desc "Run basic tests"
  Rake::TestTask.new("unit") { |t|
    t.pattern = 'test/*_test.rb'
    t.verbose = true
    t.warning = true
  }
  
end



