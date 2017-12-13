require_relative 'joke'

class User
  attr_reader :name
  attr_accessor :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(new_joke)
    jokes << new_joke
  end

  def tell(listener, new_joke)
    listener.jokes << new_joke
  end

end
