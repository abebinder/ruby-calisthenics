module FunWithStrings
  def palindrome?
    i = 0
    j = self.length - 1


    while (i < j)
      letters_eq = self[i].downcase == self[j].downcase

      if !self[i].match /\w/
        i+=1
      elsif !self[j].match /\w/
        j-=1
      elsif letters_eq
        i += 1
        j -= 1
      else
        return false
      end
    end
    return true
  end
  def count_words
    word_arr = self.split(" ")
    word_arr = word_arr.select {|word| ! word.match /\A\W+\z/}
    word_arr = word_arr.map {|word| word.gsub(/\W/, "")}
    word_arr = word_arr.map {|word| word.downcase}

    words_map = {}
    word_arr.each do |word|
      puts word
      if words_map.has_key? word
        puts "incrementing word"
        words_map[word] += 1
      else
        puts "adding word"
        words_map[word] = 1
      end

    end
    return words_map
  end
  def anagram_groups
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
