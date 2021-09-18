def greeting
    print ("Enter your name ")
    name = gets.chomp

    print ("Enter your surname ")
    surname= gets.chomp

    print ("How old are you? ")
    age = gets.to_i

    if age < 18
      p "Hi, #{name} #{surname}. You are less then 18, but starting programming is never early"
    else
      p "Hello, #{name} #{surname}. It's time to get busy"
    end
end

def foobar
  limit_number = 20

  print ("Enter first number ")
  num1 = gets.to_i

  print ("Enter second number ")
  num2 = gets.to_i

  if num1 == limit_number  or num2 == limit_number
    p num2
  else
    p num1 + num2
  end
end

greeting()
foobar()
