$:.unshift File.dirname(__FILE__)
require 'test_helper'
require 'test/unit'
require 'page_parser'

class PageParserTest < Test::Unit::TestCase
  def test_init_with_url_should_retrieve_contents_of_url
    pp = PageParser.new("http://www.google.com")
    assert_not_nil pp.data
    assert_not_equal pp.data.length, 0
  end
  
  def test_init_with_local_html_should_retrieve_contents_of_local_file
    pp = PageParser.new("./test/yellow.html")
    assert_not_nil pp.data
    assert_not_equal pp.data.length, 0
  end
end