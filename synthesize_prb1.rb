#Problem 1. Given a nested array of first names and last names, 
#return a new array with the full names.
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
lenofsubarray=names[0].length
names.each {|x| puts x[0].to_s + " "+x[1].to_s}
new_names=names.map {|x| puts x[0].to_s + " "+x[1].to_s}
new_names.each {|x| puts x}
