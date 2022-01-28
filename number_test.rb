require 'minitest/autorun'

require_relative 'number'



class NumberTest < Minitest::Test

  def test_initial_test

    assert_equal Number.in_word_form(17), 'seventeen'

  end

end

