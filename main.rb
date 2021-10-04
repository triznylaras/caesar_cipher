def encrypt(text, shift)
  for i in 0...text.length do
    char_code = text[i].ord

    #create lowercase & uppercase array 
    (a, z) = case char_code
             when 97..122 then [97, 122]   # dec code for a-z
             when 65..90  then [65, 90]    # dec code for A-Z
             else next    #else return the char
    end

    #rotate if reached the end of alphabet after shifted
    rotate = shift > 0 ? 26 : -26

    #shift the char
    char_code += shift
    char_code -= rotate unless char_code.between?(a, z)

    text[i] = char_code.chr
  end
end

puts "Please enter your text to be encrypted: "
text = gets.chomp
puts "How many shifts do you want?"
shift = gets.chomp
encrypt(text, shift.to_i)
puts text