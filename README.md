# Aoc2023

## Run a problem solution
You can define solutions as mix tasks by creating an elixir file in the `lib/mix/tasks` directory
and using the `Mix.Task` behaviour.

Let `lib/mix/tasks/d01/p1.ex` be the solution to the first part of the day one problem
```elixir
defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  def run(_) do
    ...
  end
end
```
You can run the solution via `mix d01.p1`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `aoc2023` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:aoc2023, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/aoc2023>.

