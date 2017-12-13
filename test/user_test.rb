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

end
