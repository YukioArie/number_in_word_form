require 'minitest/autorun'

require_relative 'number'



class NumberTest < Minitest::Test

  def test_initial_test

    assert_equal 'seventeen', Number.in_word_form(17)

  end



  def test_number_unity

    assert_equal 'four', Number.in_word_form(4)

  end



  def test_decimal_number

    assert_equal 'twenty seven', Number.in_word_form(27)

  end



  def test_hundredth_number_1

    assert_equal 'two hundred fifty seven', Number.in_word_form(257)

  end



  def test_hundredth_number_2

    assert_equal 'five hundred six', Number.in_word_form(506)

  end



  def test_thousandth_number_1

    assert_equal 'six thousand two hundred seven', Number.in_word_form(6_207)

  end



  def test_thousandth_number_2

    assert_equal 'fourty five thousand two hundred fifty seven', Number.in_word_form(45_257)

  end



  def test_thousandth_number_3

    assert_equal 'six hundred seventy three thousand eight hundred seven', Number.in_word_form(673_807)

  end



  def test_millionth_number_1

    assert_equal 'eight million, eight hundred ninety two thousand six hundred fourty seven',

                 Number.in_word_form(8_892_647)

  end



  def test_millionth_number_2

    assert_equal 'twelve million, six hundred fourty five thousand two hundred fifty seven',

                 Number.in_word_form(12_645_257)

  end



  def test_millionth_number_3

    assert_equal 'one hundred twenty four million, six hundred fourty five thousand two hundred fifty seven',

                 Number.in_word_form(124_645_257)

  end

end

