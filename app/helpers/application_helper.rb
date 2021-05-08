module ApplicationHelper
  $dictionary = {}
  $hash = {}
  $desired_output = []
  # $test = []
  def import_text_file #Create a hash with key as alphabet and value as related integer
    dir = Rails.public_path.join("dictionary.txt")
    File.foreach(dir).each do |alphabet|
      if alphabet.chomp.length >= 3
        key = alphabet.chomp.downcase
        $dictionary.merge!("#{key}": convert_string_to_number(key) )
      end
    end
  end
  
  def convert_string_to_number(str) #To convert the string to integers
    related_number = ""
    str_array = str.downcase.split("")
    str_array.each do |char|
      if ["a","b","c"].include?(char)
        related_number += "2"
      elsif ["d","e","f"].include?(char)
        related_number += "3"
      elsif ["g","h","i"].include?(char)
        related_number += "4"
      elsif ["j","k","l"].include?(char)
        related_number += "5"
      elsif ["m","n","o"].include?(char)
        related_number += "6"
      elsif ["p","q","r","s"].include?(char)
        related_number += "7"
      elsif ["t","u","v"].include?(char)
        related_number += "8"
      elsif ["w","x","y","z"].include?(char)
        related_number += "9"
      end
    end
    related_number
  end
  
  def find_alphabet_by_number(number) #to Find all the matching alphabet via number
    $dictionary.each do |k,v|  
      $hash.merge!("#{k}": v) if (number.to_s).include?(v)
    end
    $hash
  end

  def get_desired_array(number)    #method for the desired output
    for i in 1..$hash.length
      for j in 1..$hash.length
        if ($hash.keys[i].to_s + $hash.keys[j].to_s).length == 10
          if number.to_s.match(/^#{$hash.values[i]}/)
            $new_arr.push([$hash.keys[i],$hash.keys[j]])
          end
        end
      end
    end
    $new_arr.uniq
  end
end
