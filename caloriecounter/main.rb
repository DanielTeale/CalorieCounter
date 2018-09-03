require 'pstore'
require_relative 'classes'

# Loads previous data
data_file = PStore.new('./datafiles/data.pstore')
data_file.transaction do
  $totals = data_file[:totals]
end
puts "Welcome to Calorie Counter"
# totals = []
while true
  hash = {}
  puts "What have you eaten?"
  food = Food.new
  food.name = gets.chomp
  hash['name'] = food.name
  puts "How many calories was it?"
  calorie = gets.chomp
  calorie = calorie.to_i
  food.calories = calorie
  hash['calories'] = calorie
  hash['date'] = food.date
  $totals << hash
  puts $totals
  puts "Do you want to add another item?"
  response = gets.chomp
  response.downcase!
  if response != "yes"
    break
  end
  system('clear')
  # rescue
  #   puts "That is not a valid amount"
  # end
end
# food << item

data_file = PStore.new('./datafiles/data.pstore')
data_file.transaction do
  data_file[:totals] = $totals
end