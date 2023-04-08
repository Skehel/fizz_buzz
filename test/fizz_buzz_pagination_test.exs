defmodule FizzBuzzPaginationTest do
  use ExUnit.Case

  describe "get/2" do
    test "returns an empty list when page_number is 0" do
      assert FizzBuzzPagination.get(0, 10) == []
    end

    test "returns the first number_per_page items when page_number is 1" do
      expected = [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz"]
      assert FizzBuzzPagination.get(1, 10) == expected
    end

    test "returns the correct subset of items for a given page_number and number_per_page" do
      expected = [31, 32, "fizz", 34, "buzz", "fizz", 37, 38, "fizz", "buzz"]
      assert FizzBuzzPagination.get(4, 10) == expected
    end

    test "works with a large page_number value" do
      expected = [
        99_999_991,
        99_999_992,
        "fizz",
        99_999_994,
        "buzz",
        "fizz",
        99_999_997,
        99_999_998,
        "fizz",
        "buzz"
      ]

      assert FizzBuzzPagination.get(10_000_000, 10) == expected
    end

    test "works with a large number_per_page" do
      large_number = 1_000_000
      assert length(FizzBuzzPagination.get(3, large_number)) == large_number
    end
  end
end
