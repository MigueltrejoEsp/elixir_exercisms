defmodule HighScore do
  @score 0
  def new(), do: Map.new()

  def add_player(scores, name, score \\ @score), do: Map.put(scores, name, score)

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @score)
  end

  def update_score(scores, name, score) when score > 0,
    do: Map.update(scores, name, score, &(&1 + score))

  def get_players(scores) do
    Map.keys(scores)
  end
end
