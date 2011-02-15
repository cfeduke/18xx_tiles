require 'rubygems'
require 'logger'
require 'rake/testtask'
require './lib/page_parser'
require './lib/tile'
require 'yaml'

task :default => 'test:unit'

desc "Deletes the contents of the output folder"
task :clean do
  pwd = `pwd`.chomp("\n")
  rm_rf = %Q{rm -rf "#{pwd}/output/"}
  puts rm_rf
  %x[#{rm_rf}]
  mkdir = "mkdir #{pwd}/output"
  puts mkdir
  %x[mkdir "#{pwd}/output"]
end

namespace :get do
  BASE_18XX_INFO_TILES_URL = "http://18xx.info/tiles/"
  
  task :default => :all
  
  desc "Retrieve yellow tiles"
  task :yellow do
    retrieve "yellow.html"
  end
  
  desc "Retrieve green tiles"
  task :green do
    retrieve "green.html"
  end
  
  desc "Retrieve brown tiles"
  task :brown do
    retrieve "brown.html"
  end
  
  desc "Retrieve gray tiles"
  task :gray do
    retrieve "gray.html"
  end
  
  desc "Retrieve map tiles"
  task :map do
    retrieve "map.html"
  end
  
  desc "Retrieve all tiles"
  task :all do
    ["yellow", "green", "brown", "gray", "map"].each { |t| Rake::Task["get:#{t}"].invoke }
  end
  
  def retrieve(html_file_name)
    url = BASE_18XX_INFO_TILES_URL + html_file_name
    pp = PageParser.new({:url => url})
    pp.to_tiles.each do |tile|
        print "Outputting #{tile.number}"
        tile.get_eps
        print '.'
        File.open("./output/#{tile.number}.yml", "w") do |file|
          file.puts tile.to_yaml
          file.close
        end
        print '.'        
        File.open("./output/#{tile.number}.eps", "w") do |file|
          file.puts tile.eps_data
          file.close
        end
        puts ".\t\tdone!"
    end
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



