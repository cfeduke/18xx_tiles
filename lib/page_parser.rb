require 'rest-open-uri'
require 'hpricot'

class PageParser
  attr_accessor :data

  def initialize(args={})
    html = nil
    if (args[:url])
      html = ""
      open(args[:url]) {|f|
          f.each_line { |line| html << line }
        }
    end
    @data = html || args[:html] 
  end
  
  def to_tiles
    tiles = []
    html = Hpricot(@data)
    html.search("a[@alt&gt;0]").each {|anchor|
        tiles << Tile.parse(anchor.to_html)
      }
      
    tiles
  end
  
end