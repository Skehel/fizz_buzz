defmodule FizzBuzzWeb.FizzBuzzController do
  use Phoenix.Controller

  def fizzbuzz_paginated(conn, %{"page" => page, "integers_per_page" => integers_per_page}) do
    fizzbuzz = FizzBuzzPagination.get(String.to_integer(page), String.to_integer(integers_per_page))
    # Return a success response
    conn
    |> put_status(:created)
    |> json(fizzbuzz)
  end

  def fav_number(conn, %{"number" => number}) do
    {ok, fav_numbers} = Jason.decode(Map.get(conn.cookies, "fizzbuzz_favs", "[]"))
    {ok, new_fav_numbers} = Jason.encode([number | fav_numbers])
    # return success and store fav_numbers client side
    conn
    |> put_resp_cookie("fizzbuzz_favs", new_fav_numbers)
    |> put_status(:created)
    |> json(%{"favourites" => new_fav_numbers})
  end
end