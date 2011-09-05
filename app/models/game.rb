class Game < ActiveRecord::Base
  def finished?
    if status == 'Won!'
      true
    end
  end

  #return word with guesses filled in
  def current_word
    #for each char in the word, either fill it in if its guessed or replace with '_'
    my_word = ""
    word.each_char do |c|
      if guesses.include? c
        my_word << c
      else
      my_word << "_"
      end
    end
    my_word

  end

end
