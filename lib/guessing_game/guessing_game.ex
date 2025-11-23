defmodule GuessingGame do
  def compare(_secret_number, :no_guess), do: "Make a guess"
  def compare(_secret_number, nil), do: "Make a guess"

  def compare(secret_number, guess) when guess == secret_number do
    "Correct"
  end

  def compare(secret_number, guess) when guess > secret_number and guess < secret_number + 2 do
    "So close"
  end

  def compare(secret_number, guess) when guess < secret_number and guess > secret_number - 2 do
    "So close"
  end

  def compare(secret_number, guess) when guess > secret_number + 2 do
    "Too high"
  end

  def compare(secret_number, guess) when guess < secret_number - 2 do
    "Too low"
  end

  def compare(_secret_number), do: "Make a guess"
end
