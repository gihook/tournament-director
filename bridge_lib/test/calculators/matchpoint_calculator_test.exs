defmodule MatchpointCalculatorTest do
  use ExUnit.Case

  test "three entries flat board" do
    c1 = %Contract{suit: :hearts, level: 4, number_of_overtricks: 0, score: 420}
    c2 = %Contract{suit: :hearts, level: 4, number_of_overtricks: 0, score: 420}
    c3 = %Contract{suit: :hearts, level: 4, number_of_overtricks: 0, score: 420}

    %{entries: [r1, r2, r3]} =
      MatchpointCalculator.calculate_scores(%Board{entries: [c1, c2, c3]})

    assert r1.ns_score == 2
    assert r2.ns_score == 2
    assert r3.ns_score == 2

    assert r1.ew_score == 2
    assert r2.ew_score == 2
    assert r3.ew_score == 2
  end

  test "three entries with single top score" do
    c1 = %Contract{suit: :hearts, level: 4, number_of_overtricks: 0, score: 430}
    c2 = %Contract{suit: :hearts, level: 4, number_of_overtricks: 0, score: 420}
    c3 = %Contract{suit: :hearts, level: 4, number_of_overtricks: 0, score: 420}

    %{entries: [r1, r2, r3]} =
      MatchpointCalculator.calculate_scores(%Board{entries: [c1, c2, c3]})

    assert r1.ns_score == 4
    assert r2.ns_score == 1
    assert r3.ns_score == 1

    assert r1.ew_score == 0
    assert r2.ew_score == 3
    assert r3.ew_score == 3
  end

  test "bbo example" do
    entries = [
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 460},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 400},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 130},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 110},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 110},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: 110},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: -50},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: -100},
      %Contract{suit: :notrump, level: 3, number_of_overtricks: 0, score: -100}
    ]

    %{entries: entries_result} = MatchpointCalculator.calculate_scores(%Board{entries: entries})
    [r1, r2 | _] = entries_result
    number_of_entries = length(entries)
    total_matchpoints = (number_of_entries - 1) * 2

    r9 = entries_result |> Enum.at(8)
    r10 = entries_result |> Enum.at(9)
    r13 = entries_result |> Enum.at(12)
    r14 = entries_result |> Enum.at(13)

    assert to_percentage(r1.ns_score, total_matchpoints) == 100
    assert to_percentage(r2.ns_score, total_matchpoints) == 71.43
    assert to_percentage(r9.ns_score, total_matchpoints) == 42.86
    assert to_percentage(r10.ns_score, total_matchpoints) == 28.57
    assert to_percentage(r13.ns_score, total_matchpoints) == 14.29
    assert to_percentage(r14.ns_score, total_matchpoints) == 3.57
  end

  defp to_percentage(score, total_matchpoints) do
    result = score / total_matchpoints * 100
    Float.round(result, 2)
  end
end
