$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'test/unit'
require 'tile'

class TileTest < Test::Unit::TestCase
  def test_parse_should_retreive_long_name_url_and_number
    tile = Tile.parse(%(<a alt="Tile 14 - 14" href="tile14.html"><img border=0 width=90 height=78 src="tile14-tiny.png"></a>))
    assert_not_nil tile
    assert_equal 'Tile 14 - 14', tile.long_name
    assert_equal 'tile14.html', tile.url
    assert_equal '14', tile.number
  end
  
  def test_to_18xx_info_url_should_return_expected_url
    tile = Tile.new
    tile.url = "tile59.html"
    assert_equal "http://18xx.info/tiles/tile59.html", tile.to_url 
  end
  
  def test_to_18xx_eps_url_should_return_expected_url
    tile = Tile.new
    tile.url = "tile59.html"
    assert_equal "http://18xx.info/tiles/tile59.eps", tile.eps_url
  end
  
  def test_get_eps_should_retreive_eps_data
    return
    tile = Tile.parse(%(<a alt="Tile 14 - 14" href="tile14.html"><img border=0 width=90 height=78 src="tile14-tiny.png"></a>))
    tile.get_eps
    assert_not_nil tile.eps_data
    assert_not_equal tile.eps_data.length, 0
  end
  
  def test_parse_should_work_with_eu_tiles
    tile = Tile.parse(%(<a alt="Tile EU-82 - 18EU #82" href="tileEU-82.html"><img border="0" width="90" height="78" src="tileEU-82-tiny.png"></a>))
    assert_not_nil tile
    assert_equal 'Tile EU-82 - 18EU #82', tile.long_name
    assert_equal 'EU-82', tile.number
    assert_equal 'http://18xx.info/tiles/tileEU-82.eps', tile.eps_url
  end
end