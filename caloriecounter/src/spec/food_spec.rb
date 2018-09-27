require_relative '../classes.rb'
describe "Food" do  
  it 'should exist' do
    food = Food.new 
    expect(food).to be_an_instance_of Food
  end
end