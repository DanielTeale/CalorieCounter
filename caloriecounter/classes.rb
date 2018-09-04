class Food
  attr_accessor :name, :calories, :date
  def initialize
    @name = nil
    @calories = nil
    @date = nil
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
