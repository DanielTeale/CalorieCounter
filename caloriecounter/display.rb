require 'pstore'
require 'rainbow'
require_relative 'classes'
DATE_LEN = 25
NAME_LEN = 15
CAL_LEN = 15
EXTRA = 5
TOTAL_LEN = DATE_LEN + NAME_LEN + CAL_LEN + EXTRA + 10
HBORDER = Rainbow("_").turquoise.bright
VBORDER = Rainbow("|").turquoise.bright
def space
 EXTRA.times {print " "}
end
def list_items
 hdate = "Date"
 hname = "Item"
 hcalories = "Calories"
 free_space_dateheader = DATE_LEN - hdate.length - 1
 free_space_itemheader = NAME_LEN - hname.length - 1
 free_space_calheader = CAL_LEN - hcalories.length - 1
 TOTAL_LEN.times {print HBORDER}
 puts HBORDER
 print VBORDER
 space
 print "#{Rainbow(hdate).bright}"
 free_space_dateheader.times {print " "}
 print VBORDER
 space
 print "#{Rainbow(hname).bright}"
 free_space_itemheader.times {print " "}
 print VBORDER
 space
 print "#{Rainbow(hcalories).bright}"
 free_space_calheader.times {print " "}
 puts VBORDER
 print VBORDER
 (DATE_LEN + 4).times {print HBORDER}
 print VBORDER
 (NAME_LEN + 4).times {print HBORDER}
 print VBORDER
 (CAL_LEN + 4).times {print HBORDER}
 print VBORDER
 puts ""
$array.each do |item|
  pname = item["name"]
  calories = item["calories"].to_s
  date = item["date"].to_s
  free_space_date = DATE_LEN - date.length - 1 
  free_space_name = NAME_LEN - pname.length - 1
  free_space_calories = CAL_LEN - calories.length - 1
  print VBORDER
  space
  print "#{date}"
  free_space_date.times {print " "}
  print VBORDER
  space
  print "#{pname}"
  free_space_name.times {print " "}
  print VBORDER
  space
  print "#{calories}"
  free_space_calories.times {print " "}
  puts VBORDER
  print VBORDER
  (DATE_LEN + 4).times {print HBORDER}
  print VBORDER
  (NAME_LEN + 4).times {print HBORDER}
  print VBORDER
  (CAL_LEN + 4).times {print HBORDER}
  puts VBORDER
 end
end