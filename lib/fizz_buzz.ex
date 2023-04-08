defmodule FizzBuzz do
  @moduledoc """
  FizzBuzz keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def fizzbuzz(a, b) do
    a..b
    |> Enum.map(&fizzbuzz_map/1)
  end

  defp fizzbuzz_map(i) when rem(i, 15) == 0, do: "fizzbuzz"
  defp fizzbuzz_map(i) when rem(i, 5) == 0, do: "buzz"
  defp fizzbuzz_map(i) when rem(i, 3) == 0, do: "fizz"
  defp fizzbuzz_map(i), do: i
end
