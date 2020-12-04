defmodule AdventOfCode2017.Day15DuelingGeneratorsTest do
  use ExUnit.Case, async: true

  alias AdventOfCode2017.Day15DuelingGenerators.{Generator, Judge}

  test "generator a" do
    a = Generator.new(65, 16807)

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
    b = Generator.new(8921, 48271)

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
    judge = Judge.new(Generator.new(65, 16807), Generator.new(8921, 48271))

    assert %{matches: 1} = Judge.run(judge, 5)
    # assert %{matches: 588} = Judge.run(judge, 40_000_000)
  end

  test "solve part 1" do
    judge =
      Judge.new(Generator.new(679, 16807), Generator.new(771, 48271))
      |> Judge.run(40_000_000)

    IO.puts("Part 1: #{judge.matches}")
    IO.puts("")
  end
end
