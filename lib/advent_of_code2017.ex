defmodule AdventOfCode2017 do
  @moduledoc """
  Documentation for `AdventOfCode2017`.
  """

  def inputs(day) when is_binary(day) do
    read_raw(day)
    |> String.split("\n", trim: true)
  end

  def csv(day) when is_binary(day) do
    read_raw(day)
    |> String.split(",", trim: true)
  end

  defp read_raw(day) when is_binary(day) do
    File.read!("data/#{day}")
  end

  def to_ints(inputs) do
    Enum.map(inputs, fn i ->
      {int, ""} = Integer.parse(i)
      int
    end)
  end
end
