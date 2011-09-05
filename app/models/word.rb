class Word < ActiveRecord::Base
  #return a random word
  def self.random_word
    Word.find(rand(Word.count) + 1).word
  end
end
