require_relative 'classes'

puts "Welcome to Calorie Counter"
totals = []
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
  totals << hash
  puts totals
  puts "Do you want to add another item?"
  response = gets.chomp
  response.downcase!
  if response != "yes"
    break
  end
  # rescue
  #   puts "That is not a valid amount"
  # end
end
# food << item