require 'rest-open-uri'
require 'hpricot'

class PageParser
  attr_accessor :data, :color

  def initialize(args={})
    html = nil
    if (args[:url])
      html = ""
      args[:url] =~ /tiles\/(.*)\.html/
      @color = $1
      open(args[:url]) {|f|
          f.each_line { |line| html << line }
        }
    end
    @data = html || args[:html]
    @color ||= args[:color] || 'unknown'
  end
  
  def to_tiles
    tiles = []
    html = Hpricot(@data)
    html.search("a[@alt&gt;0]").each {|anchor|
        tile = Tile.parse(anchor.to_html)
        tile.color = @color
        tiles << tile
      }
      
    tiles
  end
  
end