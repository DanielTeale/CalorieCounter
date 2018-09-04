require 'pstore'
require_relative 'classes'
require_relative 'display'


######################################################## App #############################################################


# Loads previous data

data_file = PStore.new('./datafiles/data.pstore')
data_file.transaction do
  # $array = data_file[:array]
  $totals = data_file[:totals]
end

# $array = []
# $totals = []

# Welcome message
puts "Welcome to Calorie Counter"

# Main Loop
while true

# Initialize empty hash
  hash = Hash.new

# Collect food item
  puts "What have you eaten?"
  food = Food.new
  food.date = Time.now.strftime("%d/%m/%Y %I:%M%P")
  food.name = (gets.chomp).capitalize
  hash['date'] = food.date
  hash['name'] = food.name

# Collect calorie count
  puts "How many calories was it?"
  calorie = gets.chomp
  calorie = calorie.to_i
  food.calories = calorie
  hash['calories'] = calorie
  

# Add hash to totals array
  $totals << hash
  puts $totals

# Continue prompt
  puts "Do you want to add another item?"
  response = gets.chomp
  response.downcase!
  if response != "yes"
    break
  end
  system('clear')
end

# Save data to pstore
data_file.transaction do
  data_file[:totals] = $totals
end

food_list = Food.new
puts food_list.list_items