# PERMUTATIONS EXERCISE

# Write a Deaf Grandma program.
# Whatever you say to grandma (whatever you type in), she should respond with
# HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals).
# If you shout, she can hear you (or at least she thinks so) and yells back,
# NO, NOT SINCE 1938!
# To make your program really believable, have grandma shout a different year
# each time; maybe any year at random between 1930 and 1950.

# Extend the Deaf Grandma program:
# Change the program so that you have to shout any combination of BYE / BYE! three times in a row to leave.
# Test: If you shout any combination of BYE! or BYE, but not in a row, you are still talking to grandma.

$input = ""
$min_year = 1935
$max_year = 1951

def deaf_grandma()
  exit = ["BYE", "BYE", "BYE", "BYE!", "BYE!", "BYE!"].permutation(3).to_a
  input_bye_count = []

  loop do
    random_year = rand($min_year..$max_year)
    puts "Say something to Grandma"
    $input = gets.chomp
    if $input != $input.upcase
      input_bye_count.push($input)
      puts "HUH?! SPEAK UP, SONNY!"
    elsif $input == $input.upcase
      input_bye_count.push($input)
        if input_bye_count.last(3) == exit.find { |x| x == input_bye_count.last(3) }
          break
        else
          puts "NO, NOT SINCE #{random_year}!"
        end
    end
  end
end

deaf_grandma()
