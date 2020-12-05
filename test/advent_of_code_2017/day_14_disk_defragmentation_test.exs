defmodule AdventOfCode2017.Day14DiskDefragmentationTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2017.Day14DiskDefragmentation

  test "hex to digits" do
    assert Day14DiskDefragmentation.hex_to_bits("0") == "0000"
    assert Day14DiskDefragmentation.hex_to_bits("1") == "0001"
    assert Day14DiskDefragmentation.hex_to_bits("e") == "1110"
    assert Day14DiskDefragmentation.hex_to_bits("f") == "1111"

    # confused how 7 chars (= 28 bits) becomes 32 bits
    # assert Day14DiskDefragmentation.hex_to_bits("a0c2017") == "10100000110000100000000101110000"
  end

  test "used" do
    assert Day14DiskDefragmentation.used_squares("flqrgnkx") == 8108
  end

  test "solves part 1" do
    IO.puts("")
    IO.puts("Day 14, part 1: #{Day14DiskDefragmentation.used_squares("wenycdww")}")
  end
end
