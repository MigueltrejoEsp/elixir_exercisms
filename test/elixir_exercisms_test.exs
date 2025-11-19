defmodule ElixirExercismsTest do
  use ExUnit.Case
  doctest ElixirExercisms

  test "greets the world" do
    assert ElixirExercisms.hello() == :world
  end
end
