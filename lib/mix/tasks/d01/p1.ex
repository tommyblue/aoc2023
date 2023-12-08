defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  @digits Range.new(0, 9) |> Enum.map(&to_string/1)

  def run(_) do
    {:ok, content} = File.read("01a.input")

    content
    |> String.split("\n")
    |> Enum.map(&get_first_and_last_digit/1)
    |> Enum.map(&get_calibration_value/1)
    |> Enum.reduce(0, fn calibration_value, acc ->
      acc + calibration_value
    end)
    |> IO.puts()
  end

  defp get_first_and_last_digit(line) do
    line
    |> String.codepoints()
    |> Enum.filter(fn codepoint -> codepoint in @digits end)
    |> Enum.map(&String.to_integer/1)
    |> case do
      [] ->
        [0, 0]

      [d] ->
        [d, d]

      [first_digit | tail] ->
        [
          first_digit,
          tail |> Enum.reverse() |> hd()
        ]
    end
  end

  defp get_calibration_value([first_digit, last_digit]), do: first_digit * 10 + last_digit
end
