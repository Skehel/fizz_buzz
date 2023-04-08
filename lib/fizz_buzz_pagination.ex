defmodule FizzBuzzPagination do
  def get(0, _number_per_page) do
    []
  end

  def get(page_number, number_per_page) do
    first = number_per_page * (page_number - 1) + 1
    last = first + number_per_page - 1
    FizzBuzz.fizzbuzz(first, last)
  end
end
