require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'

class BoatTest < Minitest::Test
  def test_if_it_exists
    kayak = Boat.new(:kayak, 20)
    assert_instance_of Boat, kayak
  end

  def test_boat_type
    kayak = Boat.new(:kayak, 20)
    assert_equal :kayak, kayak.type
  end

  def test_the_price_per_hour
    kayak = Boat.new(:kayak, 20)
    assert_equal 20, kayak.price_per_hour
  end

  def test_the_hours_rented_start_at_0
    kayak = Boat.new(:kayak, 20)
    assert_equal 0, kayak.hours_rented
  end

  def test_if_hours_added_increment_by_one_hour
    kayak = Boat.new(:kayak, 20)

    assert_equal 1, kayak.add_hour
    assert_equal 2, kayak.add_hour
    assert_equal 3, kayak.add_hour
  end

  def test_the_number_of_hours_rented
    kayak = Boat.new(:kayak, 20)

    assert_equal 1, kayak.add_hour
    assert_equal 2, kayak.add_hour
    assert_equal 3, kayak.add_hour

    assert_equal 3, kayak.hours_rented
  end
end
