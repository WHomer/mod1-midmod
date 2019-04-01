require 'minitest/autorun'
require './lib/course'

class TestCourse < MiniTest::Test
  def setup
    @course = Course.new("Calculus", 2)
  end

  def test_it_exists
    assert_instance_of Course, @course
  end

  def test_it_has_a_name
    assert_equal "Calculus", @course.name
  end

  def test_it_has_a_capacity
    assert_equal 2, @course.capacity
  end

  def test_it_has_no_students
    assert_equal [], @course.students
  end

  def test_course_is_not_full?
    refute @course.full?
  end

  def test_you_can_enroll_a_student
    morgan = Student.new({name: "Morgan", age: 21})
    jordan = Student.new({name: "Jordan", age: 29})
    @course.enroll(morgan)
    @course.enroll(jordan)

    assert_equal [morgan, jordan], @course.students
  end

  def test_couse_is_now_full
    morgan = Student.new({name: "Morgan", age: 21})
    jordan = Student.new({name: "Jordan", age: 29})
    @course.enroll(morgan)
    @course.enroll(jordan)

    assert @course.full?
  end

end
