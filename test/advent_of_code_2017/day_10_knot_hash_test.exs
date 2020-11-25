defmodule AdventOfCode2017.Day10KnotHashTest do
  use ExUnit.Case, async: true

  import AdventOfCode2017
  alias AdventOfCode2017.Day10KnotHash.Knot

  test "tie one knot" do
    knot = Knot.new(5) |> Knot.twist(3)

    assert Knot.numbers(knot) == [2, 1, 0, 3, 4]
    assert knot.current == 3
    assert knot.skip_size == 1
  end

  test "tie knot that wraps around" do
    knot = Knot.new(5) |> Knot.twist(3) |> Knot.twist(4)

    assert Knot.numbers(knot) == [4, 3, 0, 1, 2]
    assert knot.current == 3
    assert knot.skip_size == 2
  end

  test "tie three knots" do
    knot = Knot.new(5) |> Knot.twist(3) |> Knot.twist(4) |> Knot.twist(1)

    assert Knot.numbers(knot) == [4, 3, 0, 1, 2]
    assert knot.current == 1
    assert knot.skip_size == 3
  end

  test "tie four knots" do
    knot = Knot.new(5) |> Knot.twist(3) |> Knot.twist(4) |> Knot.twist(1) |> Knot.twist(5)

    assert Knot.numbers(knot) == [3, 4, 2, 1, 0]
    assert knot.current == 4
    assert knot.skip_size == 4
  end

  test "solves first puzzle" do
    lengths = csv("10") |> to_ints()
    check = Enum.reduce(lengths, Knot.new, &Knot.twist(&2, &1)) |> Knot.check()

    IO.puts "Day 10, part 1: #{check}"
  end
end
