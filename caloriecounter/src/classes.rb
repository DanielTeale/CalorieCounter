require 'pstore'

######################################## CLASS AND METHODS #############################################

class Food
  attr_accessor :name, :calories, :date
  def initialize
    @name = nil
    @calories = nil
    @date = Time.now.strftime("%d/%m/%Y %I:%M%P")
    self.class.all << self
  end

  @all_items = []

  class << self
    def all
      @all_items
    end

    def count
      @all_items.count
    end
  end
end

# Prompt if user wishes to continue
def continue_prompt
  puts "Do you wish to continue?"
  response = gets.chomp
  response.downcase
end

# Load previous user data
def load_file(path, name)
  data_file = PStore.new(path)
  data = nil
  data_file.transaction do
    data = data_file[name]
  end
  if data == nil
    data = Array.new
  end
  data
end

# Save user data
def save_file(path, name, data)
  data_file = PStore.new(path)
  x = data
  data_file.transaction do
    data_file[name] = x
  end
end

# Take user input
def get_choice
  puts "\nWhat would you like to do?"
  puts "(1. Add Item 2. Check totals 3. List items 4. Set a goal 5. Reset)"
  choice = gets.chomp
  choice
end

# Get user goals from user
def get_goal(avg)
  puts "Your daily intake should be around #{avg}"
  puts "What is your goal?"
  goal = (gets.chomp).to_i
# Warn user if goal is over +- 200  
  if goal > (avg + 200)
    puts "Your goal is above the daily average"
  elsif goal < (avg - 200)
    puts "Your goal is below the daily average"
  else
    puts "Good goal! You can do it!"
  end
  goal
end