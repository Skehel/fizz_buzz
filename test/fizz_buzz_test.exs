defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest Fizzbuzz

  test "returns an empty list when start is greater than finish" do
    assert FizzBuzz.fizzbuzz(10, 1) == ["buzz", "fizz", 8, 7, "fizz", "buzz", 4, "fizz", 2, 1]
  end

  test "returns a list containing the numbers from start to finish" do
    assert FizzBuzz.fizzbuzz(1, 5) == [1, 2, "fizz", 4, "buzz"]
  end

  test "replaces multiples of 3 with fizz" do
    assert FizzBuzz.fizzbuzz(1, 6) == [1, 2, "fizz", 4, "buzz", "fizz"]
  end

  test "replaces multiples of 5 with buzz" do
    assert FizzBuzz.fizzbuzz(4, 10) == [4, "buzz", "fizz", 7, 8, "fizz", "buzz"]
  end

  test "replaces multiples of 15 with fizzbuzz" do
    assert FizzBuzz.fizzbuzz(11, 20) == [
             11,
             "fizz",
             13,
             14,
             "fizzbuzz",
             16,
             17,
             "fizz",
             19,
             "buzz"
           ]
  end

  test "should allow viewing values up to 100,000,000,000" do
    expected = [
      "fizzbuzz",
      99_999_999_991,
      99_999_999_992,
      "fizz",
      99_999_999_994,
      "buzz",
      "fizz",
      99_999_999_997,
      99_999_999_998,
      "fizz",
      "buzz"
    ]

    assert FizzBuzz.fizzbuzz(99_999_999_990, 100_000_000_000) == expected
  end
end
