require 'rainbow'
require_relative 'classes'

##################################### TABLE FORMATTING #############################################

# Table parameters
DATE_LEN = 25 # Column 1
NAME_LEN = 40 # Column 2
CAL_LEN = 15 # Column 3
EXTRA = 5 # Padding
TOTAL_LEN = DATE_LEN + NAME_LEN + CAL_LEN + EXTRA + 10 # Totals
HBORDER = Rainbow(" ").turquoise.bright.bg(:orange) # Horizontal border 
VBORDER = Rainbow(" ").turquoise.bright.bg(:orange) # Vertical border 

# Padding method
def space
 EXTRA.times {print " "}
end

def list_title
  title = "Welcome to Calorie Counter"
  (TOTAL_LEN + 1).times {print HBORDER}
  puts HBORDER
  print VBORDER
  TOTAL_LEN.times {print " "}
  puts VBORDER
  print VBORDER
  3.times {space}
  7.times {print " "}
  print title
  free_space_title = DATE_LEN + NAME_LEN + CAL_LEN - title.length - 7
  free_space_title.times {print " "}
  puts VBORDER
  print VBORDER
  TOTAL_LEN.times {print HBORDER}
  puts VBORDER
end

def list_items
# Table headings
 hdate = "Date"
 hname = "Item"
 hcalories = "Calories"
# Parameter logic
 free_space_dateheader = DATE_LEN - hdate.length - 1
 free_space_itemheader = NAME_LEN - hname.length - 1
 free_space_calheader = CAL_LEN - hcalories.length - 1
# Table generation
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

 # Item formatting
 $array.each do |item|
 # Table Entries
  pname = item["name"]
  calories = item["calories"].to_s
  date = item["date"].to_s
  free_space_date = DATE_LEN - date.length - 1 
  free_space_name = NAME_LEN - pname.length - 1
  free_space_calories = CAL_LEN - calories.length - 1
 # Table generation
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