require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test__jokes_is_empty_array_upon_initialize
    robocop = User.new("Robocop")

    assert_equal [], robocop.jokes
  end

  def test_jokes_contains_new_joke_after_learn
    new_joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    ash = User.new("Ash")
    ash.learn(new_joke)

    assert_equal [new_joke], ash.jokes
  end

  def tell_jokes_puts_joke_into_other_users_joke_array
    new_joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    barney = User.new("Barney")
    larry = User.new("Larry")
    barney.tell(larry, new_joke)

    assert_equal [new_joke], larry.jokes
  end

  def test_count_returns_number_of_jokes_in_user_array
    joke_1 = joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    jon = User.new("Jon")
    jon.learn(joke_1)
    jon.learn(joke_2)

    assert_equal 2, jon.jokes.count
  end

  def test_perform_routine_tells_other_user_multiple_jokes
    joke_1 = joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    flannery = User.new("Flannery")
    connor = User.new("Connor")
    flannery.learn(joke_1)
    flannery.learn(joke_2)
    flannery.perform_routine_for(connor)

     assert_equal [joke_1, joke_2], connor.jokes
     assert_equal 2, connor.jokes.count
  end

  def test_user_can_learn_routine
    mad_dog = User.new("Mad Dog")

    mad_dog.learn_routine('./jokes.csv')
    assert_equal 100, mad_dog.jokes.count
  end

end
