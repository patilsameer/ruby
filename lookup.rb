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
    rmv_hsh_n_emt_str=dns_raw.reject { |line| line.empty? or line[0] == "#" }#removing hash and empty lines,string
    split_data=rmv_hsh_n_emt_str.map { |line| line.strip.split(", ") }#split the entry into columns using ','
    rmvd_fls_rcrd=split_data.reject { |record| record.length < 3 }# discarding false entries in zone file
    rmvd_fls_rcrd.each_with_object({}) do |record, records|# preparing hash for dns entries
      records[record[1]] = {
        type: record[0],
        target: record[2],
      }
    end
  end

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
 