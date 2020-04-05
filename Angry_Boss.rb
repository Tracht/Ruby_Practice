# ANGRY BOSS PROGRAM

# ARRAY and CONTROL FLOW PRACTICE

# Write an Angry Boss program. It should rudely ask what you want.
# Whatever you answer, the Angry Boss should yell it back to you, and then fire you.
# For example, if you type in "I want a raise.", it should yell back
# WHADDAYA MEAN "I WANT A RAISE."?!?  YOU'RE FIRED!!
#
# 1. Extend the program: after 3 identical requests in a row, the boss gives in and says,
#   >> FINE! I give in, you've got some determination!


spacing = 40

puts "//////////////////".center(spacing)
puts "Angry boss program".center(spacing)
puts "type \"nevermind\" to quit".center(spacing)
puts "try not to cry!".center(spacing)
puts ""

def angryboss()
  requests = Array.new
  loop do
    puts "WHAT DO YOU WANT?!"
    input = gets.chomp
    requests.push(input)
    break if input == "nevermind"
      if requests.last(3) == [input, input, input]
          puts ">>> FINE! I give in, you've got some determination!"
          break
      elsif
          puts ">>> WHADDAYA MEAN \"#{input.upcase}\" ?!? YOU'RE FIRED!!"
      end
      puts ""
    end
    puts ""
 end

angryboss()
