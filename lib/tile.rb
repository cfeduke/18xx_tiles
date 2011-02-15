require 'rest-open-uri'

class Tile
  attr_accessor :color, :long_name, :number, :eps_data, :url
  
  BASE_18XX_INFO_TILE_URL = "http://18xx.info/tiles/"
  
  def to_url
    BASE_18XX_INFO_TILE_URL + @url
  end
  
  def eps_url
    BASE_18XX_INFO_TILE_URL + @url.sub(/\.html/, '.eps')
  end
  
  def get_eps
    @eps_data = ""
    open(eps_url) { |eps| eps.each_line { |line| @eps_data << line } }
    raise "EPS was empty" unless @eps_data.length > 0
    @eps_data
  end
  
  class << self
    def parse(anchor_html)
      tile = Tile.new
      begin
        tile.long_name, tile.url, tile.number = %r{alt="(?<long_name>.*?)" href="(?<url>tile(?<number>(?:EU|\d{0,2})?-?\d+).html)"}.match(anchor_html).captures
      rescue NoMethodError
        puts "Unable to parse #{anchor_html}"
        return nil
      end
      
      tile
    end
  end
end