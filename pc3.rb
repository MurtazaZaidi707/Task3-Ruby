require 'csv'

def gen_pass
  flag=false
  print "Enter number of alpha\n"
  num_of_alpha = gets.chomp
  while num_of_alpha.to_i < 7
    print "Enter number of alpha\n"
    num_of_alpha = gets.chomp
  end
  # print num_of_alpha
  alpha_arr = Array('A'..'Z') + Array('a'..'z')
  ranarr = Array.new(num_of_alpha.to_i) { alpha_arr.sample }.join
  puts ranarr

  print "Enter number of numbers\n"
  num_of_num = gets.chomp
  while num_of_num.to_i < 7
    print "Enter number of numbers\n"
    num_of_num = gets.chomp
  end

  # print num_of_alpha
  num_arr = Array('0'..'9')
  rannum = Array.new(num_of_num.to_i) { num_arr.sample }.join
  puts rannum


  print "Enter number of symbols\n"
  num_of_symbols = gets.chomp
  while num_of_symbols.to_i < 7
    print "Enter number of symbols\n"
    num_of_symbols = gets.chomp
  end
  # print num_of_alpha
  symbols_arr = Array('!'..'+') + Array(':'..'@')
  ransymbols = Array.new(num_of_symbols.to_i) { symbols_arr.sample }.join
  puts ransymbols

  temp = ranarr + rannum + ransymbols
  puts temp

  CSV.foreach("data.csv") do |row|
    #puts row
    if(row==temp)
        flag=true
    end
  end

  if(flag==false)
      File.open("data.csv", 'a+') {|f| f.write(temp + "\n")}
  end

end

# main
gen_pass
