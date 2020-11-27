defmodule AdventOfCode2017.Day11DiskDefragmentationTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2017.Day11DiskDefragmentation

  test "hex to digits" do
    assert Day11DiskDefragmentation.hex_to_bits("0") == "0000"
    assert Day11DiskDefragmentation.hex_to_bits("1") == "0001"
    assert Day11DiskDefragmentation.hex_to_bits("e") == "1110"
    assert Day11DiskDefragmentation.hex_to_bits("f") == "1111"

    # confused how 7 chars (= 28 bits) becomes 32 bits
    # assert Day11DiskDefragmentation.hex_to_bits("a0c2017") == "10100000110000100000000101110000"
  end

  test "used" do
    assert Day11DiskDefragmentation.used_squares("flqrgnkx") == 8108
  end

  test "solves part 1" do
    IO.puts("")
    IO.puts("Day 11, part 1: #{Day11DiskDefragmentation.used_squares("wenycdww")}")
  end
end
