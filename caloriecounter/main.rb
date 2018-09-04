require 'pstore'
require_relative 'classes'



######################################################## App #############################################################


# Loads previous data
$totals = []
$array = []
data_file = PStore.new('./datafiles/data.pstore')
data_file.transaction do
  $array = data_file[:array]
  $totals = data_file[:totals]
  if $totals == nil
    $totals = []
  end
end

# Welcome message
puts "Welcome to Calorie Counter"

# Main Loop
while true
# Initialize empty hash
  hash = Hash.new
  puts "What would you like do to?"
  puts "(1. Add Item 2. Check totals 3. List items)"
  choice = gets.chomp
  if choice == "1"
    # Collect food item
    puts "What have you eaten?"
    food = Food.new
    food.date = Time.now.strftime("%d/%m/%Y %I:%M%P")
    food.name = (gets.chomp).capitalize
    hash['name'] = food.name

  # Collect calorie count
    puts "How many calories was it?"
    calorie = gets.chomp
    calorie = calorie.to_i
    food.calories = calorie
    hash['calories'] = calorie
    hash['date'] = food.date

  # Add hash to totals array
    $array << hash
    $totals << calorie
  
  # Continue prompt
    puts "Do you want to add another item?"
    response = gets.chomp
    response.downcase!
    if response != "yes"
     break
    end
    system('clear')
  end

  if choice == "2"
    sum = 0
    $totals.each {|k| sum += k}
    puts "You have consumed #{sum} calories"
  end

  if choice == "3"
    list_items
  end
end

# Save data to pstore
data_file.transaction do
  data_file[:totals] = $totals
  data_file[:array] = $array
end