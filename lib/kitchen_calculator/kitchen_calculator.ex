defmodule KitchenCalculator do
  @us_cup 240
  @us_fluid_ounce 30
  @us_teaspoon 5
  @us_tablespoon 15

  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:milliliter, value}), do: {:milliliter, value}
  def to_milliliter({:cup, value}), do: {:milliliter, value * @us_cup}
  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * @us_fluid_ounce}
  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * @us_teaspoon}
  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * @us_tablespoon}

  def from_milliliter({:milliliter, unit}, :milliliter), do: {:milliliter, unit}
  def from_milliliter({:milliliter, unit}, :cup), do: {:cup, unit / @us_cup}

  def from_milliliter({:milliliter, unit}, :fluid_ounce),
    do: {:fluid_ounce, unit / @us_fluid_ounce}

  def from_milliliter({:milliliter, unit}, :teaspoon), do: {:teaspoon, unit / @us_teaspoon}
  def from_milliliter({:milliliter, unit}, :tablespoon), do: {:tablespoon, unit / @us_tablespoon}

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
