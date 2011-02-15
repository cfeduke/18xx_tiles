$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'test/unit'
require 'page_parser'

class PageParserTest < Test::Unit::TestCase
  def test_init_with_url_should_retrieve_contents_of_url
    pp = PageParser.new({:url => "http://www.google.com"})
    assert_not_nil pp.data
    assert_not_equal pp.data.length, 0
    assert_equal 'unknown', pp.color
  end
  
  def test_init_with_local_html_should_retrieve_contents_of_local_file
    pp = PageParser.new({:url => "./test/tiles/yellow.html"})
    assert_not_nil pp.data
    assert_not_equal pp.data.length, 0
    assert_equal 'yellow', pp.color
  end
  
  def test_to_tiles_should_parse_expected_number_and_values_of_tiles
    html = <<HTML
    <table border=2 cellpadding=1 cellspacing=1> 
    <tr><td valign=bottom align=center>1<br><a
    alt="Tile 1 - 1" href="tile1.html"><img border=0 width=90 height=78 src="tile1-tiny.png"></a></td> 
    <td valign=bottom align=center>2<br><a
    alt="Tile 2 - 2" href="tile2.html"><img border=0 width=90 height=78 src="tile2-tiny.png"></a></td> 
    <td valign=bottom align=center>3<br><a
    alt="Tile 3 - 3" href="tile3.html"><img border=0 width=90 height=78 src="tile3-tiny.png"></a></td> 
    <td valign=bottom align=center>4<br><a
    alt="Tile 4 - 4" href="tile4.html"><img border=0 width=90 height=78 src="tile4-tiny.png"></a></td> 
    <td valign=bottom align=center>5<br><a
    alt="Tile 5 - 5" href="tile5.html"><img border=0 width=90 height=78 src="tile5-tiny.png"></a></td>
    <td valign=bottom align=center>202<br><i>(ID# 1202)</i><br>202/1876<br><a
    alt="Tile 1202 - 202/1876" href="tile1202.html"><img border=0 width=90 height=78 src="tile1202-tiny.png"></a></td>
    </tr></table>
HTML
    pp = PageParser.new({:html => html, :color => 'yellow'})
    assert_not_equal pp.data.length, 0
    tiles = pp.to_tiles
    assert_equal 6, tiles.length
    assert_equal "Tile 2 - 2", tiles[1].long_name
    assert_equal "Tile 1202 - 202/1876", tiles.last.long_name
    assert_equal "1202", tiles.last.number
    assert_equal 'yellow', tiles.last.color
  end
  
  def test_verify_green_can_be_parsed
    pp = PageParser.new({:url => "./test/tiles/green.html"})
    assert_not_nil pp.data
    assert_not_equal pp.data.length, 0
    assert_equal 'green', pp.color
  end
  
end