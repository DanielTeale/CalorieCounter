require 'http'
require 'json'

def get_calorie(query)
  response = HTTP.headers('x-app-id'=>"7ec93003", 'x-app-key'=> "cbab14d9b8520ffb8b69243ded50b9c7", "Content-Type"=>"application/x-www-form-urlencoded")
    .post("https://trackapi.nutritionix.com/v2/natural/nutrients", :form => {"query" => "#{query}"})
  response = JSON.parse(response)
  response["foods"][0]["nf_calories"].round(0).to_i
end