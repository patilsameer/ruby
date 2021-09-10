#Problem 1. Given two arrays books and authors, merge them into a single Hash. 
#The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# fill in code that will create a Hash that looks like:
#   {
#     :bruno => "Design as Art",
#     :neal => "Anathem",
#     ...
#   }
array=[0,1,2]
library={}
array.each {|i| library[":#{authors[i]}"]=[books[i]]}
puts library
puts "\n\n\n"
puts library.keys
library.keys.each{|x| puts "#{x} = #{library[x]}"}


# array2=[0,1,2]
# result=authors.map.with_index {|x,i| "#{i}:#{x}"}
# puts result

# library3={}
# array.each {|i| library3["#{result[i]}"]=[books[i]]}
# puts library3[0:Bruno Munari]
