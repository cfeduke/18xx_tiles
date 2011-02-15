require 'rest-open-uri'

class PageParser
  attr_accessor :data

  def initialize(url)
    html = ""
    open(url) {|f|
        f.each_line { |line| html << line }
      }
    @data = html
  end
  

  
  # parses the HTML and returns an array of tiles
  def parse_html(html)

  end
end