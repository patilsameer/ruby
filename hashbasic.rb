library = {
  "rowling" => "Harry Potter",
  "lahiri" => "Interpreter of Maladies"
}

puts library["lahiri"]    # This will print "Interpreter of Maladies"

library = {}
library["austen"] = ["Pride and Prejudice", "Sense and Sensibility"]
library["asimov"] = ["Robots of Dawn", "I, Robot"]

authors = library.keys
puts "These are the authors in my catalog: #{authors.join(', ')}"

library.each do |author, books|
  puts "#{author.capitalize} wrote the books #{books.join(', ')}"
end

# You shoud see this output:
#   Austen wrote the books Pride and Prejudice, Sense and Sensibility
#   Asimov wrote the books Robots of Dawn, I, Robot

a = :name
c = :"multiple words"  # Enclose multi-word symbols in double quotes

# symbols are just like any other data and
# we can put them inside arrays and hashes
c = [:x, :y]

library = {
  :austen => ["a", "b"]
}
library[:rowling] = ["x"]
