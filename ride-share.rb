########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# Top Layer: Data for all Drivers
# Second Layer: Each individual Driver
# Third Layer: Each of the Driver's Trips
# Fourth Layer: Data on each individual trip: Date, Cost, Rider ID, Rating


########################################################
# Step 2: Assign a data structure to each layer

# Top Layer: Data for all Drivers - Hashes - Multiple key:value pairs, one for each driver
# Second Layer: Each individual Driver - A single hash. Key is the driver, value is an array containing a list of the driver's trips
# Third Layer: Each of the Driver's Trips - An entry in said array, each in the form of a hash
# Fourth Layer: Data on each individual trip: A hash containing: Date (String), Cost (Integer), Rider ID (String), Rating (Integer)

########################################################
# Step 3: Make the data structure!

driver_data = {
    DR0001: [
        {
            date: "3rd Feb 2016",
            rider_id: "RD0003",
            cost: 10,
            rating: 3
        },
        {
            date: "3rd Feb 2016",
            rider_id: "RD0015",
            cost: 30,
            rating: 4
        },
        {
            date: "5th Feb 2016",
            rider_id: "RD0003",
            cost: 45,
            rating: 2
        }
    ],

    DR0002: [
        {
            date: "3rd Feb 2016",
            rider_id: "RD0073",
            cost: 25,
            rating: 5
        },
        {
            date: "4th Feb 2016",
            rider_id: "RD0013",
            cost: 15,
            rating: 1
        },
        {
            date: "5th Feb 2016",
            rider_id: "RD0066",
            cost: 35,
            rating: 3
        }
    ],

    DR0003: [
        {
            date: "4th Feb 2016",
            rider_id: "RD0066",
            cost: 5,
            rating: 5
        },
        {
            date: "5th Feb 2016",
            rider_id: "RD0003",
            cost: 50,
            rating: 2
        }
    ],

    DR0004: [
        {
            date: "3rd Feb 2016",
            rider_id: "RD0022",
            cost: 5,
            rating: 5
        },
        {
            date: "4th Feb 2016",
            rider_id: "RD0022",
            cost: 10,
            rating: 4
        },
        {
            date: "5th Feb 2016",
            rider_id: "RD0022",
            cost: 10,
            rating: 4
        }
    ]
}


########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# 1. the number of rides each driver has given
def total_rides(data)
  ride_count = []

  data.each do |driver, rides|
    ride_count << rides.count
  end

  i = 0

  return data.each do |driver, rides|
    puts "Driver #{driver}: #{ride_count[i]} rides."
    i += 1
  end
end

puts "The number of rides each driver has given:"
total_rides(driver_data)
puts ""


# 2. the total amount of money each driver has made
def total_earnings(data)
  driver_earnings = []

  data.each do |driver, rides|
    ride_earnings = []
    rides.each do |ride|
      ride_earnings << ride[:cost]
    end
    driver_earnings << ride_earnings.sum
  end

  i = 0
  return data.each do |driver, rides|
    puts "Driver #{driver}: $#{driver_earnings[i]}."
    i += 1
  end
end

puts "The total amount of money each driver has made:"
total_earnings(driver_data)
puts ""


# 3. the average rating for each driver
def average_rating(data)
  driver_rating = []

  data.each do |driver, rides|
    ratings = []
    rides.each do |ride|
      ratings << ride[:rating]
    end
    driver_rating << ratings.sum.to_f / ratings.count
  end

  i = 0
  return data.each do |driver, rides|
    puts "Driver #{driver}: #{sprintf('%.2f', driver_rating[i])}"
    i += 1
  end
end

puts "The average rating for each driver:"
average_rating(driver_data)
puts ""


# 4. Which driver made the most money?
def most_money(data)
  driver_earnings = []

  data.each do |driver, rides|
    ride_earnings = []
    rides.each do |ride|
      ride_earnings << ride[:cost]
    end
    driver_earnings << ride_earnings.sum
  end

  if driver_earnings == []
    return nil
  end

  most_index = driver_earnings.index(driver_earnings.max)

  return puts "Driver DR000#{most_index + 1} has the highest earnings with $#{driver_earnings[most_index]}."
end

most_money(driver_data)
puts ""


# 5.  Which driver has the highest average rating?
def highest_rating(data)
  driver_rating = []

  data.each do |driver, rides|
    ratings = []
    rides.each do |ride|
      ratings << ride[:rating]
    end
    driver_rating << ratings.sum.to_f / ratings.count
  end

  if driver_rating == []
      return nil
  end

  highest_index = driver_rating.index(driver_rating.max)

  return puts "Driver DR000#{highest_index + 1} has the highest average rating."
end

highest_rating(driver_data)
