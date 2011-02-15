require 'rest-open-uri'

class Tile
  attr_accessor :color, :long_name, :number, :eps_data, :url
  
  BASE_18XX_INFO_TILE_URL = "http://18xx.info/tiles/"
  
  def to_url
    BASE_18XX_INFO_TILE_URL + @url
  end
  
  def to_eps_url
    BASE_18XX_INFO_TILE_URL + @url.sub(/\.html/, '.eps')
  end
  
  def get_eps
    @eps_data = ""
    open(to_eps_url) { |eps| eps.each_line { |line| @eps_data << line } }
    raise "EPS was empty" unless @eps_data.length > 0
    @eps_data
  end
  
  class << self
    def parse(anchor_html)
      tile = Tile.new
      tile.long_name, tile.url, tile.number = %r{alt="(?<long_name>.*?)" href="(?<url>tile(?<number>\d+).html)"}.match(anchor_html).captures
      tile
    end
  end
end