#Problem 2. Given two arrays books and authors, merge them and print who wrote which book.
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
  # fill in code that will print:
  #   Design As Art was written by Bruno Munari
  #   Anathem was written by Neal Stephenson
  #   ...
 result=books.map.with_index {|book, i| "#{book} is in index #{i}"}
puts result
result2=books.map.with_index{|book,i| "#{book} was written by #{authors[i]}"}
puts result2