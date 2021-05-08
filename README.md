# README

Things you may want to cover:

* Pull the code from github https://github.com/ffarhhan/NumberToWord.git

* After Pulling Use ```bundle``` command to install the gems.

* Run the console and then use the commands mentioned below: 


  * ```helper.import_text_file``` this command helps to import the dictionary for us.
  * After importing the hash use this command ```helper.find_alphabet_by_number(number)```
  * Example: 
        
        2.7.3 :005 > helper.find_alphabet_by_number(2282668687)
        
        This will result in:
        
         => [[:acta, :mounts], [:bat, :amounts], [:bat, :contour], [:cat, :amounts], [:cat, :contour], :catamounts]
