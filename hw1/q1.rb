module FunWithStrings
  def palindrome?
    letter  =  self.downcase.gsub(/\W/,"")
    return letter == ( letter.reverse ) 
  end
  def count_words
     array = self.downcase.strip.split(/\W+/)
     hashtable = Hash.new(0)
     array.each{|i| hashtable[i] = hashtable[i]+1}
     return hashtable
  end
  def anagram_groups
    return self.split.group_by{|word| word.chars.sort}.values
     
  end
end  

# make all the above functions available as instance methods on Strings:

class String 
  include FunWithStrings
end