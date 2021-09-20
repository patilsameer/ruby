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
    data=dns_raw.reject { |line| line.empty? or line[0] == "#" }
    data1=data.map { |line| line.strip.split(", ") }
    data2=data1.reject { |record| record.length < 3 }
    data2.each_with_object({}) do |record, records|
      records[record[1]] = {
        type: record[0],
        target: record[2],
      }
    end
  end

  #def parse_dns(dns_raw)
  #  result=[]
  #  dns_raw.select do |row|
  #      str=row[0]
  #      if str!='#' && !(str.nil? || str.strip.empty?)#to remove lines with # and whitespaces blanks empty lines
  #          temp=row.split(',')
  #          if(temp.>3)
  #          result.push(temp)
  #          end
  #      end
  #  end
  # result
  #end

  def resolve(dns_records, lookup_chain, domain)
    record = dns_records[domain]
    if (!record)
      lookup_chain[0] = "Error: Record not found for " + domain
      lookup_chain
    elsif record[:type] == "CNAME"
      lookup_chain << record[:target]
      resolve(dns_records, lookup_chain, record[:target])
    elsif record[:type] == "A"
      lookup_chain << record[:target]
    else
      lookup_chain << "Invalid record type for " + domain
    end
  end


  #def resolve(array,chain,url)
  #  j=0
  #  array.each do |element|
  #      if element[1].strip.eql? url.strip
  #          j=1
  #          chain.push(element[2])                
  #          if element[0].strip.eql? "CNAME"
  #              chain=resolve(array,chain,element[2])
  #          end
  #      end
  #  end
  #  if j==1
  #  chain
  #  else
  #    chain=["Error: record not found for #{url}"]
  #  end
    
  #end


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
 