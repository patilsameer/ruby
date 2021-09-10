todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]

# Fill in code that will create a Hash that looks like:
#   {
#     :money =>
#       ["Send invoice", "Pay rent", ...],
#     ...
#   }

#library for hashing
library={}

#get all cateogries - money, organize, food
category=todos.map{|x| x[1]}
category=category.uniq
puts category

#get all items of money
money=todos.select{ |item| item[1]==category[0]}
money=money.map{|item|item[0]}
puts money
library[category[0]]=[money]
#get all items of organize
organize=todos.select{ |item| item[1]==category[1]}
organize=organize.map{|item|item[0]}
puts organize 
library[category[1]]=[organize]

#get all items of food
food=todos.select{ |item| item[1]==category[2]}
food=food.map{|item|item[0]}
puts food 
library[category[2]]=[food]


puts library # it will display the below output
# Fill in code that will create a Hash that looks like:
#   {
#     :money =>
#       ["Send invoice", "Pay rent", ...],
#     ...
#   }

#library for hashing




#this is the final output of the above all jugad
puts "money:"
money.each{|item| puts " "+item}
puts "organize:"
organize.each{|item| puts " "+item}
puts "food:"
food.each{|item| puts " "+item}


# Fill in code that will print:
#   money:
#     Send invoice
#     Pay rent
#     Pay taxes
#   organize:
#     Clean room
#     Arrange books
#   food:
#     Buy groceries
