require 'pstore'
require_relative 'classes'
# require_relative 'main'

data_file = PStore.new("./datafiles/data.pstore")
data_file.transaction do
  $totals = data_file[:totals]
end

DATE_LEN = 25
NAME_LEN = 15
CAL_LEN = 15

# def list_items
  hdate = "Date"
  hname = "Item"
  hcalories = "Calories"

  free_space_dateheader = DATE_LEN - hdate.length - 1
  free_space_itemheader = NAME_LEN - hname.length - 1
  free_space_calheader = CAL_LEN - hcalories.length - 1


  70.times {print "#"}
  puts "#"
  print "|"
  # 62.times {print " "}
  5.times {print " "}
  print "#{hdate}"
  free_space_dateheader.times {print " "}
  print "|"
  5.times {print " "}
  print "#{hname}"
  free_space_itemheader.times {print " "}
  print "|"
  5.times {print " "}
  print "#{hcalories}"
  free_space_calheader.times {print " "}
  puts "|"
  print "|"
  29.times {print "_"}
  print "|"
  19.times {print "_"}
  print "|"
  19.times {print "_"}
  print "|"
  puts ""

$totals.each do |item|
    pname = item["name"]
    calories = item["calories"].to_s
    date = item["date"].to_s
    free_space_date = DATE_LEN - date.length - 1  
    free_space_name = NAME_LEN - pname.length - 1
    free_space_calories = CAL_LEN - calories.length - 1

    print "|"
    5.times {print " "}
    print "#{date}"
    free_space_date.times {print " "}
    print "|"
    5.times {print " "}
    print "#{pname}"
    free_space_name.times {print " "}
    print "|"
    5.times {print " "}
    print "#{calories}"
    free_space_calories.times {print " "}
    puts "|"
    print "|"
    29.times {print "_"}
    print "|"
    19.times {print "_"}
    print "|"
    19.times {print "_"}
    puts "|"
  end
# end