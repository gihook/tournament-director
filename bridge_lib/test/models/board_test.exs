defmodule BoardTest do
  use ExUnit.Case

  test "initialize board 1" do
    board = Board.initialize(1)

    assert board.number == 1
    assert board.vulnerability == :none
    assert board.dealer == :north
  end

  test "North made 4 hearts +1 vulnerable" do
    contract = %Contract{declearer: :north, suit: :hearts, level: 4, number_of_overtricks: 1}
    board = Board.initialize(2)
    result = board |> Board.add_contract(contract)

    [head] = result.entries
    assert head.vulnerability == :red
    assert head.score == 650
  end

  test "East made 5cl non vulnerable" do
    contract = %Contract{declearer: :east, suit: :clubs, level: 5, number_of_overtricks: 0}
    board = Board.initialize(2)
    result = board |> Board.add_contract(contract)

    [head] = result.entries
    assert head.vulnerability == :green
    assert head.score == -400
  end
end
