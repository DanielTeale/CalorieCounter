require_relative 'classes'
require_relative 'display'
require_relative 'api'


######################################################## MAIN #############################################################

# Load user data or default if none available ## See classes.rb
$array = load_file('./datafiles/data.pstore', :array)
$totals = load_file('./datafiles/data.pstore', :totals)
$goal = load_file('./datafiles/data.pstore', :goal)

# Welcome message
list_title

# Main Loop
while true
  choice = get_choice # See classes.rb
  if choice == "1"
# Initialize empty hash
    hash = Hash.new
# Collect food item
    puts "What have you eaten?"
    food = Food.new
# Capitalize all words in input
    food.name = (((gets.chomp).split(" ")).each {|k| k.capitalize!}).join(" ")
    hash['name'] = food.name

# Collect calorie count for item
    # puts "How many calories was it?"
    calorie = get_calorie(food.name)
    food.calories = calorie
    hash['calories'] = calorie
    hash['date'] = food.date

# Add hash to totals array
    $array << hash
    $totals << calorie
    response = continue_prompt # See classes.rb
    if response != "yes"
      break
    end
    system('clear')
  end

# Add members of totals array
  if choice == "2"
    sum = 0
    $totals.each {|k| sum += k}
# Give user feedback on totals in relation to goal
      if sum > $goal
        goal_difference = sum - $goal
        puts "Oh no! You have consumed #{sum} calories, #{goal_difference} more than your goal"
      elsif sum < $goal
        goal_difference = $goal - sum
        puts "Doing well! You have consumed #{sum} calories, #{goal_difference} less than your goal"
      end
    response = continue_prompt # See classes.rb
    if response != "yes"
      break
    end
    system('clear')
  end

# Return full list of items to user
  if choice == "3"
    list_items # See display.rb
    response = continue_prompt # See classes.rb
    if response != "yes"
      break
    end
    system('clear')
  end

# Set user goals
  if choice == "4"
# Get user gender to use appropriate average daily intake
    puts "What is your gender?(M/F)"
    response = (gets.chomp).downcase
# Use male intake
    while true do
      if response == 'm'
        avg_intake = 2500
        break
# Use female intake  
      elsif response == 'f'
        avg_intake = 2000
        break
      else
        puts "Invalid input"
      end
    end
    $goal = get_goal(avg_intake) # See classes.rb
    response = continue_prompt # See classes.rb
    if response != 'yes'
      break
    end
    system('clear')
  end
# Reset user data
  if choice == "5"
    system('clear')
    puts "Are you sure you wish to reset?(Y/N)"
    response = (gets.chomp).downcase
# Initalize session data - this gets saved when exiting and overwrites previous data  
    if response == 'y'
      $goal = 0
      $array = []
      $totals = []
      puts "OK, your record is now erased"
    else
      puts "Your record is preserved"
    end
  end
end


# Save data to pstore ## See classes.rb
save_file('./datafiles/data.pstore', :array, $array)
save_file('./datafiles/data.pstore', :totals, $totals)
save_file('./datafiles/data.pstore', :goal, $goal)