#Problem 3. Print the given list of todos by category. 
#(You haven't learned Hashes yet, so use only arrays.)
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]

category=todos.map{|x| x[1]}
category=category.uniq
puts category

money=todos.select{ |item| item[1]==category[0]}
money=money.map{|item|item[0]}
puts money

organize=todos.select{ |item| item[1]==category[1]}
organize=organize.map{|item|item[0]}
puts organize 

food=todos.select{ |item| item[1]==category[2]}
food=food.map{|item|item[0]}
puts food 


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
