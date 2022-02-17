#print "Hello #{ARGV}"
# puts String.instance_methods


# puts "Какой язык программирования вам нравится больше всего"
# lanh = STDIN.gets.chomp
# case lanh
# when "ruby"
#     puts "норм лижешь"
# when "c++"
#   puts "жалко тебя добряк, но будет руби"
# when "c#"
#   puts "ООПшный респект, но будет руби"
# when "kotlin"
#   puts "красиво делаешь, но передумай"
# end


#условный оператор варианты
# puts "Какой язык программирования вам нравится больше всего"
# lanh = STDIN.gets.chomp
# if lanh == "ruby" then
#   puts "норм лижешь"
# else puts "теперь будет руби"
# end


# x = if lanh == "ruby" then "норм лижешь"
# else "теперь будет руби" end
# puts x


# unless lanh != "ruby" then
#   puts "норм лижешь"
# else
#   puts "теперь будет руби"
# end

# x = unless lanh!="ruby" then "норм лижешь"
# else "теперь будет руби" end
# puts x


# puts "Введите команду операционной системы"
# system(STDIN.gets.chomp)
# exec(STDIN.gets.chomp)
# puts 'STDIN.gets.chomp'


# puts "Введите команду руби"
# puts `irb`
# puts `STDIN.gets.chomp`

# Задание 2

x = Integer(ARGV[0])
sum = 0
loop do
  sum += x % 10
  x = x/10
  break if x == 0
end
puts sum
