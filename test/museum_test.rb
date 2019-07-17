gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(@imax)
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @bob = Patron.new("Bob", 20)
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    @sally = Patron.new("Sally", 20)
    @sally.add_interest("IMAX")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_its_attributes

    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [@imax, @gems_and_minerals, @dead_sea_scrolls], @dmns.exhibits
  end

  def test_can_add_exhibit

    assert_equal [@imax, @gems_and_minerals, @dead_sea_scrolls], @dmns.exhibits
  end

  def test_recommend_exhibits
    # skip
    # binding.pry

    assert_equal [@dead_sea_scrolls, @gems_and_minerals], @dmns.recommend_exhibits(@bob)
    assert_equal [@imax], @dmns.recommend_exhibits(@sally)
  end
end
