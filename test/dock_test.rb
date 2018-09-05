require 'minitest/autorun'
require 'minitest/pride'
require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test
  def test_if_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_the_attributes
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_the_revenue_for_one_hour
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    kayak_1.add_hour

    assert_equal 20, dock.revenue
  end

  def test_the_log_hours_for_two_boats
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)

    kayak_1.add_hour
    kayak_2.add_hour

    assert_equal 2, dock.log_hour
  end

  def test_the_log_hours_for_three_boats
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(canoe, patrick)

    kayak_1.add_hour
    kayak_2.add_hour
    canoe.add_hour
    kayak_1.add_hour
    kayak_2.add_hour

    assert_equal 5, dock.log_hour
    assert_equal 105, dock.revenue
  end

  def test_rental_hours_to_second_renter
    dock = Dock.new("The Rowing Dock", 3)

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)

    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(canoe, patrick)

    kayak_1.add_hour
    kayak_2.add_hour
    canoe.add_hour
    kayak_1.add_hour
    kayak_2.add_hour

    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)

    3.times {sup_1.add_hour}
    3.times {sup_2.add_hour}

    assert_equal 11, dock.log_hour
    assert_equal 195, dock.revenue
  end
end
