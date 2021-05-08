module ApplicationHelper
  $dictionary = {}
  def import_text_file
    dir = Rails.public_path.join("dictionary.txt")
    File.foreach(dir).each do |alphabet|
      if alphabet.chomp.length >= 3
        key = alphabet.chomp.downcase
        $dictionary.merge!("#{key}": convert_string_to_number(key) )
      end
    end
  end
  
  def convert_string_to_number(str)
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
    related_number.to_i
  end
  
  $arr = []
  def find_alphabet_by_number(number)
    $dictionary.each do |k,v|
      if v.to_s.include?(number.to_s)
        $arr.push(k)
      end
    end
  end
end
