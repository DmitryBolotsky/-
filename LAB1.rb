#print "Hello #{ARGV}"
# puts String.instance_methods


puts "Какой язык программирования вам нравится больше всего"
lanh = STDIN.gets.chomp
case lanh
when "ruby"
    puts "норм лижешь"
when "c++"
  puts "жалко тебя добряк, но будет руби"
when "c#"
  puts "ООПшный респект, но будет руби"
when "kotlin"
  puts "красиво делаешь, но передумай"
end
