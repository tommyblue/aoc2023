defmodule Mix.Tasks.D01.P2 do
  use Mix.Task

  @digits ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  @w_numbers ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  def run(_) do
    {:ok, content} = File.read("lib/mix/tasks/d01/input.txt")

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
    |> extract_numbers()
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

  def extract_numbers(codepoints, current_word \\ "", digits \\ [])

  def extract_numbers([], _, digits) do
    Enum.reverse(digits)
  end

  def extract_numbers([head | tail], current_word, digits) do
    cond do
      head in @digits ->
        {v, _} = Integer.parse(head)
        extract_numbers(tail, "", [v | digits])

      (current_word <> head) in @w_numbers ->
        extract_numbers([head | tail], "", [numerify(current_word <> head) | digits])

      is_prefix?(current_word <> head) ->
        extract_numbers(tail, current_word <> head, digits)

      true ->
        extract_numbers(tail, head, digits)
    end
  end

  defp is_prefix?(word) do
    Enum.any?(@w_numbers, fn w -> String.starts_with?(w, word) end)
  end

  defp get_calibration_value([first_digit, last_digit]), do: first_digit * 10 + last_digit

  defp numerify("one"), do: 1
  defp numerify("two"), do: 2
  defp numerify("three"), do: 3
  defp numerify("four"), do: 4
  defp numerify("five"), do: 5
  defp numerify("six"), do: 6
  defp numerify("seven"), do: 7
  defp numerify("eight"), do: 8
  defp numerify("nine"), do: 9
end
