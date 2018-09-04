require_relative 'classes'
require_relative 'display'


######################################################## App #############################################################

$array = load_file('./datafiles/data.pstore', :array)
$totals = load_file('./datafiles/data.pstore', :totals)
# Welcome message
puts "Welcome to Calorie Counter"

# Main Loop
while true
  choice = get_choice
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
    puts "How many calories was it?"
    calorie = (gets.chomp).to_i
    food.calories = calorie
    hash['calories'] = calorie
    hash['date'] = food.date

  # Add hash to totals array
    $array << hash
    $totals << calorie
    response = continue_prompt
    if response != "yes"
      break
    end
    system('clear')
  end

  if choice == "2"
    sum = 0
    $totals.each {|k| sum += k}
    puts "You have consumed #{sum} calories"
    response = continue_prompt
    if response != "yes"
      break
    end
    system('clear')
  end

  if choice == "3"
    list_items # FIXME: Change to list_items when complete
    response = continue_prompt
    if response != "yes"
      break
    end
    system('clear')
  end
end


# Save data to pstore
save_file('./datafiles/data.pstore', :array, $array)
save_file('./datafiles/data.pstore', :totals, $totals)