recipients = [
    ["Srinath"],
    ["Jadeja", "Kambli"],
    ["Sachin", "Sidhu", "Kumble","Sameer","Snehal"]
  ]

  emails = recipients[0]
  if emails.length == 1
    puts "Hello #{emails[0]}!"
  elsif emails.length == 2
    puts "Hello #{emails[0]} and #{emails[1]}!"
  elsif emails.length > 2
    puts "Hello #{emails[0..-2].join(', ')}, and #{emails.last}!"
  end

  emails = recipients[1]
  if emails.length == 1
    puts "Hello #{emails[0]}!"
  elsif emails.length == 2
    puts "Hello #{emails[0]} and #{emails[1]}!"
  elsif emails.length > 2
    puts "Hello #{emails[0..-2].join(', ')}, and #{emails.last}!"
  end

  emails = recipients[2]
  if emails.length == 1
    puts "Hello #{emails[0]}!"
  elsif emails.length == 2
    puts "Hello #{emails[0]} and #{emails[1]}!"
  elsif emails.length > 2
    puts "Hello #{emails[0..-2].join(', ')}, and #{emails.last}!"
  end


  recipients.each do |emails|
    if emails.length == 1
      puts "Hello #{emails[0]}!"
    elsif emails.length == 2
      puts "Hello #{emails[0]} and #{emails[1]}!"
    elsif emails.length > 2
      puts "Hello #{emails[0..-2].join(', ')}, and #{emails.last}!"
    end
    end

    def generate_salutation(emails)
        if emails.length == 1
          "Hello #{emails[0]}!"
        elsif emails.length == 2
          "Hello #{emails[0]} and #{emails[1]}!"
        elsif emails.length > 2
          "Hello #{emails[0..-2].join(', ')}, and #{emails.last}!"
        end
      end
      
    
      recipients.each do |emails|
        puts generate_salutation(emails)
      end

      def avg(nums)
        return nums.sum / nums.length.to_f
      end

      def avg(nums)
        nums.sum / nums.length.to_f
      end