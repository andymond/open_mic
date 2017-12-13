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

  def perform_routine_for(listener)
    jokes.each do |joke|
      listener.jokes << joke
    end
  end

  def learn_routine(joke_file)
    file = File.readlines(joke_file)
    file.shift
    routine = file
    new_routine = routine.each do |joke|
      learn(joke)
    end
    new_routine
  end

end
