class Joke

  attr_accessor :joke_hash, :id, :question, :answer

  def initialize(joke_hash)
    @joke_hash = joke_hash
    @id = joke_hash[:id]
    @question = joke_hash[:question]
    @answer = joke_hash[:answer]
  end


end
