# print "Hello #{ARGV[0]}"
# puts "Hello World"
# puts String.instance_methods
# puts String.methods
# puts "Привет".methods


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
# puts 'STDIN.gets.chomp'


# puts "Введите команду руби"
# puts `irb`
# puts `STDIN.gets.chomp`

# Задание 2

# x = Integer(ARGV[0])
# sum = 0
# loop do
#   sum += x % 10
#   x = x/10
#   break if x == 0
# end
# puts sum



def sumOfNum(x)
  sum = 0
  loop do
    sum += x % 10
    x = x/10
    break if x == 0
  end
  puts sum
end
def sumOfNumRet(x)
  sum = 0
  loop do
    sum += x % 10
    x = x/10
    break if x == 0
  end
  return sum
end

def minQuant(x)
  min = x
  loop do
    if(min>(x%10))
      min = x % 10
    end
    x/=10
    break if x == 0
  end
  puts min
end

def maxQuant(x)
  max = 0
  loop do
    if(max<(x%10))
      max = x % 10
    end
    x/=10
    break if x == 0
  end
  puts max
end

def QuantMultiply(x)
  mult = 1
  loop do
    mult *= x % 10
    x/=10
    break if x == 0
  end
  puts mult
end

def simpleDel(x)
  sum = 0
  i = 2
  while i <= x
    if x % i == 0
      sum += i
      x /= i
    else
      i+=1
    end
  end
  puts sum
end

def oddQuant(x)
  count = 0
  loop do
    if (x % 10 % 2 != 0) & (x % 10 > 3)
      count +=1
    end
    x/=10
    break if x == 0
  end
  puts count
end

# def MultyDef(x)
#   sumx = sumOfNumRet(x)
#   proiz = 1
# (1 ... x).each do |i|
# if (x%i == 0)&(sumOfNumRet(i)<sumx)
#   proiz*=i
# end
# end
#   puts proiz
# end




# num = ARGV[0].to_i
# case num
# when 1
#   sumOfNum(ARGV[1].to_i)
# when 2
#   minQuant(ARGV[1].to_i)
# when 3
#   maxQuant(ARGV[1].to_i)
# when 4
#   QuantMultiply(ARGV[1].to_i)
# when 5
#   simpleDel(ARGV[1].to_i)
# when 6
#   oddQuant(ARGV[1].to_i)
# when 7
#   MultyDef(ARGV[1].to_i)
# else puts "Hello World"
# end





def minEl(arr)
  min = arr[0]
  (1 ... arr.size).each do |i|
    if arr[i]<min then
      min = arr[i]
    end
  end
  puts min
end

def maxEl(arr)
  max = arr[0]
  (1 ... arr.size).each do |i|
    if arr[i]>max then
      max = arr[i]
    end
  end
  puts max
end

def sumEl(arr)
  sum = 0
  (0 ... arr.size).each do |i|
    sum += arr[i]
  end
  puts sum
end

def multEl(arr)
  mult = 1
  (0 ... arr.size).each do |i|
    mult *= arr[i]
  end
  puts mult
end

def f32method(method, *list)
  case method
  when 1
      puts "min => #{minEl(*list)}"
  when 2
      puts "max => #{maxEl(*list)}"
  when 3
      puts "sum => #{sumEl(*list)}"
  when 4
      puts "prod => #{multEl(*list)}"
  end
end

def f32
  puts "1 {min} | 2 {max} | 3 {sum} | 4 {prod} ?"
  method = gets.chomp.to_i
  puts "k {keyboard} | f {file} ?"
  kof = gets.chomp
  list = []
  case kof
  when "k"
      str = gets.chomp
      str.split.each { |el| list.push el.to_i }
  when "f"
      file = File.new("f32.txt", "r:UTF-8")
      content = file.read
      content.split.each { |el| list.push el.to_i }
  end
  f32method(method, *list)
end

def colAfterMax
  list = []
  puts "list ?"
  str = gets.chomp
  str.split.each { |el| list.push el.to_i }
  max = list[0]
  imax = 0
  list.each_with_index do |el, i|
      if el > max then
          max = el
          imax = i
      end
  end
  puts "col of #{max} => #{imax}"
end
 
def afterMin
  list = []
  puts "list ?"
  str = gets.chomp
  str.split.each { |el| list.push el.to_i }
  min = list[0]
  imin = 0
  list.each_with_index do |el, i|
      if el < min then
          min = el
          imin = i
      end
  end

  puts list[imin,list.size()]+list[0,imin]
end

def interMax
  list = []
  puts "list ?"
  str = gets.chomp
  puts "a?"
  a = gets.chomp.to_i
  puts "b?"
  b = gets.chomp.to_i
  str.split.each { |el| list.push el.to_i }
  max = list[a]
  imax = a
  list2 = list[a,b]
  list2.each_with_index do |el, i|
      if el > max then
          max = el
          imax = i
      end
  end
  puts "max of #{max}"
end

def idndofLeft
list = []
  puts "list ?"
  str = gets.chomp
  counter = 0
  str.split.each { |el| list.push el.to_i }
  temp = (1...list.size).select{|x| list[x] < list[x-1]}
  puts temp
end

idndofLeft


