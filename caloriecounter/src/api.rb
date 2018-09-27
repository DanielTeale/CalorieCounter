require 'http'

def get_calorie(query)
  # query= gets.chomp
  response = HTTP.headers('x-app-id'=>"7ec93003", 'x-app-key'=> "cbab14d9b8520ffb8b69243ded50b9c7", "Content-Type"=>"application/x-www-form-urlencoded")
    .post("https://trackapi.nutritionix.com/v2/natural/nutrients", :form => {"query" => "#{query}"})
  p response.body.to_s
end

get_calorie