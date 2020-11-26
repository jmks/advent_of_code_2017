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

    IO.puts("")
    IO.puts "Day 10, part 1: #{check}"
  end

  test "inputs" do
    assert AdventOfCode2017.Day10KnotHash.calculate_input("1,2,3") == [49,44,50,44,51,17, 31, 73, 47, 23]
  end

  test "knot hashes" do
    assert AdventOfCode2017.Day10KnotHash.knot_hash("") == "a2582a3a0e66e6e86e3812dcb672a272"
    assert AdventOfCode2017.Day10KnotHash.knot_hash("AoC 2017") == "33efeb34ea91902bb2f59c9920caa6cd"
    assert AdventOfCode2017.Day10KnotHash.knot_hash("1,2,3") == "3efbe78a8d82f29979031a4aa0b16a9d"
    assert AdventOfCode2017.Day10KnotHash.knot_hash("1,2,4") == "63960835bcdc130f0b66d7ff4f6a5a8e"
  end

  test "solves the second puzzle" do
    hash = AdventOfCode2017.Day10KnotHash.knot_hash(inputs("10") |> hd)

    IO.puts("")
    IO.puts "Day 10, part 2: #{hash}"
  end
end
