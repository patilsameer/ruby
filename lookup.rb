def get_command_line_argument
    # ARGV is an array that Ruby defines for us,
    # which contains all the arguments we passed to it
    # when invoking the script from the command line.
    # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
    if ARGV.empty?
      puts "Usage: ruby lookup.rb <domain>"
      exit
    end
    ARGV.first
  end
  
  # `domain` contains the domain name we have to look up.
  domain = get_command_line_argument
  
  # File.readlines reads a file and returns an
  # array of string, where each element is a line
  # https://www.rubydoc.info/stdlib/core/IO:readlines
  dns_raw = File.readlines("zone")
  
  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..

  def parse_dns(dns_raw)
    result=[]
    dns_raw.select do |row|
        str=row[0]
        if str!='#' && !(str.nil? || str.strip.empty?)#to remove lines with # and whitespaces blanks empty lines
            temp=row.split(',')
            result.push(temp)
        end
    end
   result
  end

  def resolve(array,chain,url)
    j=0
    array.each do |element|
        if element[1].strip.eql? url.strip
            j=1
            chain.push(element[2])                
            if element[0].strip.eql? "CNAME"
                chain=resolve(array,chain,element[2])
            end
        end
    end
    if j==1
    chain
    else
      chain=["Error: record not found for #{url}"]
    end
    
  end


  # To complete the assignment, implement `parse_dns` and `resolve`.
  # Remember to implement them above this line since in Ruby
  # you can invoke a function only after it is defined.
  dns_records = parse_dns(dns_raw)
  lookup_chain = [domain]
  lookup_chain = resolve(dns_records, lookup_chain, domain)
  #cnt=lookup_chain.count()
  #puts cnt
  #if cnt>1
  puts lookup_chain.join(" => ")  
  #else
  #  puts lookup_chain
  #nd
  #puts lookup_chain
 