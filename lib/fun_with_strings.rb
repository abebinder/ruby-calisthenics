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
        words_map[word] += 1
      else
        words_map[word] = 1
      end

    end
    return words_map
  end
  def anagram_groups
    word_arr = self.split(" ")
    word_arr = word_arr.select {|word| ! word.match /\A\W+\z/}
    word_arr = word_arr.map {|word| word.gsub(/\W/, "")}
    word_arr = word_arr.map {|word| word.downcase}
    word_arr = word_arr.map {|word| [word.chars.sort.join, word]}
    word_arr = word_arr.sort {|x,y| x[0] <=> y[0]}
    word_arr = word_arr.group_by{|x| x[0]}.values

    output = []
    word_arr.each do |matches|
      output += [matches.map {|tup| tup[1]}]
    end
    output
    # curr_sorted_word = word_arr[0][0]
    # partial_arr = [word_arr[0][1]]
    # output = []
    #
    # (1..word_arr.length - 1).each do |i|
    #   if curr_sorted_word == word_arr[i][0]
    #     partial_arr = partial_arr + [word_arr[i][1]]
    #     if i == word_arr.length - 1
    #       output += [partial_arr]
    #     end
    #   else
    #     output += [partial_arr]
    #     partial_arr = [word_arr[i][1]]
    #     curr_sorted_word = word_arr[i][0]
    #   end
    #
    #
    #
    # end
    # output
  end
  end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
