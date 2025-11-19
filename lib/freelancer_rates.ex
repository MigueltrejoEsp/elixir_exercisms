defmodule FreelancerRates do
  def daily_rate(hourly_rate)
      when is_number(hourly_rate) and hourly_rate >= 0 and hourly_rate <= 100,
      do: hourly_rate * 8.0

  def daily_rate(_), do: {:error, "Invalid input"}

  def apply_discount(before_discount, discount)
      when is_number(before_discount) and before_discount >= 0 and discount >= 0 and
             discount <= 100,
      do: before_discount * (1 - discount / 100)

  def monthly_rate(hourly_rate, discount)
      when is_number(hourly_rate) and discount >= 0 and discount <= 100,
      do:
        hourly_rate
        |> daily_rate()
        |> Kernel.*(22)
        |> apply_discount(discount)
        |> Float.ceil()
        |> trunc()

  def days_in_budget(budget, hourly_rate, discount) do
    net_daily_rate =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    Float.floor(budget / net_daily_rate, 1)
  end
end
