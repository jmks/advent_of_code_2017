defmodule AdventOfCode2017.Day15DuelingGeneratorsTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2017.Day15DuelingGenerators.{Generator, Judge}

  test "generator a" do
    a = Generator.new(65, 16807, 1)

    {first, a} = Generator.next(a)
    {second, a} = Generator.next(a)
    {third, a} = Generator.next(a)
    {fourth, a} = Generator.next(a)
    {fifth, _} = Generator.next(a)

    assert first == 1092455
    assert second == 1181022009
    assert third == 245556042
    assert fourth == 1744312007
    assert fifth == 1352636452
  end

  test "generator b" do
    b = Generator.new(8921, 48271, 1)

    {first, b} = Generator.next(b)
    {second, b} = Generator.next(b)
    {third, b} = Generator.next(b)
    {fourth, b} = Generator.next(b)
    {fifth, _} = Generator.next(b)

    assert first == 430625591
    assert second == 1233683848
    assert third == 1431495498
    assert fourth == 137874439
    assert fifth == 285222916
  end

  @tag timeout: :timer.minutes(3)
  test "judging" do
    judge = Judge.new(Generator.new(65, 16807, 1), Generator.new(8921, 48271, 1))

    assert %{matches: 1} = Judge.run(judge, 5)
    # assert %{matches: 588} = Judge.run(judge, 40_000_000)
  end

  test "solve part 1" do
    judge =
      Judge.new(Generator.new(679, 16807, 1), Generator.new(771, 48271, 1))
      |> Judge.run(40_000_000)

    IO.puts("Part 1: #{judge.matches}")
    IO.puts("")
  end

  test "new generators" do
    a = Generator.new(65, 16807, 4)

    assert {1352636452, a} = Generator.next(a)
    assert {1992081072, a} = Generator.next(a)
    assert {530830436, a} = Generator.next(a)
    assert {1980017072, a} = Generator.next(a)
    assert {740335192, a} = Generator.next(a)

    b = Generator.new(8921, 48271, 8)

    assert {1233683848, b} = Generator.next(b)
    assert {862516352, b} = Generator.next(b)
    assert {1159784568, b} = Generator.next(b)
    assert {1616057672, b} = Generator.next(b)
    assert {412269392, b} = Generator.next(b)
  end

  test "slower judging" do
    judge = Judge.new(Generator.new(65, 16807, 4), Generator.new(8921, 48271, 8))

    assert %{matches: 309} = Judge.run(judge, 5_000_000)
  end

  test "solve part 2" do
    judge = Judge.new(Generator.new(679, 16807, 4), Generator.new(771, 48271, 8))
    judge = Judge.run(judge, 5_000_000)

    IO.puts("Part 2: #{judge.matches}")
    IO.puts("")
  end
end
