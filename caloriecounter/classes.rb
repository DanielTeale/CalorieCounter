require 'pstore'

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

def continue_prompt
  puts "Do you wish to continue?"
  response = gets.chomp
  response.downcase!
  if response != "yes"
   abort
  end
  system('clear')
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
  puts "What would you like do to?"
  puts "(1. Add Item 2. Check totals 3. List items)"
  choice = gets.chomp
  choice
end