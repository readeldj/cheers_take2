# require 'rubygems'
# require 'bundler/setup'
require "minitest/autorun"

class TestCheersIntegration < Minitest::Test

  def test_help_message
  	output = `./cheers`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_two_valid_arguments
  	output = `./cheers Abby 08/25`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_one_valid_and_one_invalid_arguments
  	output = `./cheers Abby Aug/25`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I couldn't understand that. Could you give that to me in mm/dd format next time?
EOS
    assert_equal expected, output
  end

  def test_one_invalid_and_one_valid_arguments
  	output = `./cheers 08/25 08/25`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_two_invalid_arguments
  	output = `./cheers 08/25 August/25`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_regular_name_as_argument
  	output = `./cheers Abby`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!
EOS
    assert_equal expected, output
  end

  def test_name_with_hyphen_arguments
  	output = `./cheers Abby-Smith`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Give me an... S
Give me an... M
Give me an... I
Give me a... T
Give me an... H
Abby-Smith’s just GRAND!
EOS
    assert_equal expected, output
  end

  def test_invalid_name_as_birthday_argument
  	output = `./cheers 08/25`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_invalid_name_as_non_word_chars_argument
  	output = `./cheers *&^%%`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_invalid_name_as_empty_string_argument
  	output = `./cheers ""`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_invalid_name_as_whitespace_argument
  	output = `./cheers " "`
  	expected = <<EOS
I'd cheer for you, if only I knew who you were :(
Try again with './cheers.rb' [Name] [MM/DD Birthday]
EOS
    assert_equal expected, output
  end

  def test_valid_month_as_8_25_argument
  	output = `./cheers Abby 8/25`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_valid_month_as_08_25_argument
  	output = `./cheers Abby 08/25`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_valid_birthday_that_has_passed_argument
  	output = `./cheers Abby 01/01`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday has passed! Happy Belated Birthday!
EOS
    assert_equal expected, output
  end

  def test_valid_birthday_that_has_not_passed_yet_argument
  	output = `./cheers Abby 08/25`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

Awesome!  Your birthday is in 45 days! Happy Birthday in advance!
EOS
    assert_equal expected, output
  end

  def test_invalid_month_as_25_08_argument
  	output = `./cheers Abby 25/08`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end

  def test_invalid_month_as_08_25_2015_argument
  	output = `./cheers Abby 08/25/2015`
  	expected = <<EOS
Give me an... A
Give me a... B
Give me a... B
Give me a... Y
Abby’s just GRAND!

I would wish you a Happy Birthday, if I knew when that was!
EOS
    assert_equal expected, output
  end
end
