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
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @tj = Patron.new("TJ", 7)
    @tj.add_interest("IMAX")
    @tj.add_interest("Dead Sea Scrolls")
    @bob = Patron.new("Bob", 20)
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("IMAX")
    @sally = Patron.new("Sally", 20)
    @sally.add_interest("Dead Sea Scrolls")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_its_attributes

    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [ @gems_and_minerals, @imax, @dead_sea_scrolls], @dmns.exhibits
  end

  def test_can_add_exhibit

    assert_equal [@gems_and_minerals, @imax, @dead_sea_scrolls], @dmns.exhibits
  end

  def test_recommend_exhibits
    # skip
    # binding.pry

    assert_equal [@dead_sea_scrolls, @imax], @dmns.recommend_exhibits(@bob)
    assert_equal [@dead_sea_scrolls], @dmns.recommend_exhibits(@sally)
  end

  def test_can_admit
    @dmns.admit(@bob)
    @dmns.admit(@sally)
    assert_equal [@bob, @sally], @dmns.patrons
  end

  def test_patrons_by_exhibit_interest
    @dmns.admit(@bob)
    @dmns.admit(@sally)

    # binding.pry
    expected = {@gems_and_minerals => [], @dead_sea_scrolls => [@bob, @sally], @imax => [@bob]}
    assert_equal expected, @dmns.patrons_by_exhibit_interest
  end

  def test_patrons_of_exhibits
    @dmns.admit(@tj)
    assert_equal 7, @tj.spending_money
    @dmns.admit(@bob)

  end
end
