class Number

  @numbers_word_hash = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',

                         10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',

                         17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen',

                         20 => 'twenty', 30 => 'thirty', 40 => 'fourty', 50 => 'fifty', 60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety', 100 => 'hundred', 1000 => 'thousand', 1_000_000 => 'million' }

  def self.in_word_form(number)

    number_array = number.to_s.split('')

    number_array_slice_3 = number_array.reverse.each_slice(3).map(&:reverse).reverse

    final_array = number_array_slice_3.map { |arr| arr.reverse.each_slice(2).map(&:reverse).reverse }



    return @numbers_word_hash[number] if @numbers_word_hash.has_key?(number)

    return _decimal(final_array.first).strip if is_decimal_number?(number_array)

    return _hundredth(final_array.sample).strip if is_hundred_number?(final_array)

    return _thousandth(final_array).strip if final_array.count == 2

    return _millionth(final_array).strip if is_millionth_number?(final_array)

  end



  def self.is_decimal_number?(array)

    return true if array.count == 2

  end



  def self.is_hundred_number?(array)

    return true if array.count == 1 && array.sample.last.count == 2

  end



  def self.is_millionth_number?(array)

    return true if array.count == 3

  end



  def self._decimal(array)

    if @numbers_word_hash.has_key?(array.join.to_i)

      (@numbers_word_hash[array.join.to_i]).to_s

    else

      "#{@numbers_word_hash[array.first.first.to_i * 10]} #{@numbers_word_hash[array.last.last.to_i]}"

    end

  end



  def self._hundredth(array)

    if @numbers_word_hash.has_key?(array.last.join.to_i)

      "#{@numbers_word_hash[array.first.join.to_i]} hundred #{@numbers_word_hash[array.last.join.to_i]}"

    else

      "#{@numbers_word_hash[array.first.join.to_i]} hundred #{@numbers_word_hash[array.last.first.to_i * 10]} #{@numbers_word_hash[array.last.last.to_i]}"

    end

  end



  def self._thousandth(array)

    if @numbers_word_hash.has_key?(array.first.join.to_i)

      "#{@numbers_word_hash[array.first.join.to_i]} thousand #{_hundredth(array.last)}"

    elsif array.first.count == 2

      "#{_hundredth(array.first)} thousand #{_hundredth(array.last)}"

    else

      "#{@numbers_word_hash[array.first.first.first.to_i * 10]} #{@numbers_word_hash[array.first.last.last.to_i]} thousand #{_hundredth(array.last)}"

    end

  end



  def self._millionth(array)

    if @numbers_word_hash.has_key?(array.first.join.to_i)

      "#{@numbers_word_hash[array.first.join.to_i]} million, #{_thousandth(array.drop(1))}"

    elsif array.first.count == 2

      "#{_hundredth(array.first)} million, #{_thousandth(array.drop(1))}"

    else

      "#{@numbers_word_hash[array.first.first.first.to_i * 10]} #{@numbers_word_hash[array.first.last.last.to_i]} million #{_thousandth(array.drop(1))}"

    end

  end

end

