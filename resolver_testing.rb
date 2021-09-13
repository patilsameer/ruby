arr=[
    "# RECORD TYPE, SOURCE, DESTINATION",
    "A, ruby-lang.org, 221.186.184.75",
    "A, google.com, 172.217.163.46",
    "",
    "CNAME, www.ruby-lang.org, ruby-lang.org",
    "CNAME, mail.google.com, google.com",
    "CNAME, gmail.com, mail.google.com",
]

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


  getfinal=parse_dns(arr)
  puts getfinal
  #puts getfinal[0][2]

  #getfinal.each {|x| puts x[2]}


  domainforsearch="www.ruby-lang.org"
  chain=[domainforsearch]

#  puts "first output is"+chain.join("=>")+"\n"  
  
  def resolve(array,chain,url)
    array.each do |element|
        if element[1].strip.eql? url.strip
            chain.push(element[2])                
            if element[0].strip.eql? "CNAME"
                chain=resolve(array,chain,element[2])
            end
        end
    end
    chain
  end



  chain=resolve(getfinal,chain,domainforsearch)
  #puts "thats it\n"

  puts chain.join(" => ")
  #puts "output is "+chain.join(" => ")  
