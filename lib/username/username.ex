defmodule Username do
  def sanitize(username) do
    Enum.flat_map(username, &do_sanitize/1)
  end

  defp do_sanitize(?ä), do: ~c"ae"
  defp do_sanitize(?ö), do: ~c"oe"
  defp do_sanitize(?ü), do: ~c"ue"
  defp do_sanitize(?ß), do: ~c"ss"

  defp do_sanitize(char) when char in ?a..?z or char == ?_, do: [char]
  defp do_sanitize(_), do: []
end
