defmodule Lasagna do
  def expected_minutes_in_oven do
    40
  end

  def remaining_minutes_in_oven(time_elapsed) do
    expected_minutes_in_oven()
    |> do_remaining_minutes(time_elapsed)
  end

  def preparation_time_in_minutes(layers) do
    layers
    |> do_preparation_time(2)
  end

  def total_time_in_minutes(layers, time_elapsed) do
    preparation_time_in_minutes(layers) + time_elapsed
  end

  def alarm do
    "Ding!"
  end

  defp do_remaining_minutes(x, y), do: x - y
  defp do_preparation_time(x, y), do: x * y
end
