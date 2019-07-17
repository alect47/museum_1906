gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/exhibit'
require './lib/patron'

class PatronTrackerTest < Minitest::Test

  def setup

    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists

    assert_instance_of Patron, @bob
  end

  def test_its_attributes

    assert_equal "Bob", @bob.name
    assert_equal 20, @bob.spending_money
    assert_equal [], @bob.interests
  end

  def test_add_interst
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @bob.interests
  end

end
