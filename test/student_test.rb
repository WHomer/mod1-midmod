require 'minitest/autorun'
require './lib/student'

class TestStudent < MiniTest::Test
  def setup
    @morgan = Student.new({name:
      "Morgan", age: 21})
  end

  def test_it_exists
    assert_instance_of Student, @morgan
  end

  def test_it_has_a_name
    assert_equal "Morgan", @morgan.name
  end

  def test_it_has_a_age
    assert_equal 21, @morgan.age
  end

  def test_it_has_empty_scores
    assert_equal [], @morgan.scores
  end

  def test_it_can_log_scores
    @morgan.log_score(89)
    @morgan.log_score(78)

    assert_equal [89, 78], @morgan.scores
  end

  def test_it_can_average_all_scores
    @morgan.log_score(89)
    @morgan.log_score(78)

    assert_equal 83.5, @morgan.grade
  end
end
