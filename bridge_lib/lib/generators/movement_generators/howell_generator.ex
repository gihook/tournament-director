defmodule HowellGenerator do
  def create(number_of_board_per_round) do
    table1 = %Table{
      number: 1,
      rounds: [
        %Round{number: 1, ns_pair_id: 1, ew_pair_id: 2, board_set: 1},
        %Round{number: 2, ns_pair_id: 1, ew_pair_id: 4, board_set: 2},
        %Round{number: 3, ns_pair_id: 1, ew_pair_id: 6, board_set: 3},
        %Round{
          number: 4,
          ns_pair_id: 1,
          ew_pair_id: 5,
          board_set: 4
        },
        %Round{number: 5, ns_pair_id: 1, ew_pair_id: 3, board_set: 5}
      ]
    }

    table2 = %Table{
      number: 2,
      rounds: [
        %Round{
          number: 1,
          ns_pair_id: 3,
          ew_pair_id: 4,
          board_set: 3
        },
        %Round{
          number: 2,
          ns_pair_id: 2,
          ew_pair_id: 6,
          board_set: 3
        },
        %Round{number: 3, ns_pair_id: 4, ew_pair_id: 5, board_set: 1},
        %Round{number: 4, ns_pair_id: 6, ew_pair_id: 3, board_set: 1},
        %Round{number: 5, ns_pair_id: 5, ew_pair_id: 2, board_set: 5}
      ]
    }

    table3 = %Table{
      number: 3,
      rounds: [
        %Round{number: 1, ns_pair_id: 5, ew_pair_id: 6, board_set: 2},
        %Round{
          number: 2,
          ns_pair_id: 3,
          ew_pair_id: 5,
          board_set: 3
        },
        %Round{number: 3, ns_pair_id: 2, ew_pair_id: 3, board_set: 2},
        %Round{
          number: 4,
          ns_pair_id: 4,
          ew_pair_id: 2,
          board_set: 3
        },
        %Round{number: 5, ns_pair_id: 6, ew_pair_id: 4, board_set: 5}
      ]
    }

    tables =
      [table1, table2, table3]
      |> Enum.map(fn %Table{rounds: rounds} = table ->
        updated_rounds =
          rounds
          |> Enum.map(fn round -> update_round_boards(round, number_of_board_per_round) end)

        %Table{table | rounds: updated_rounds}
      end)

    %Movement{tables: tables, type: "Howell 3"}
  end

  defp update_round_boards(%Round{board_set: board_set} = round, number_of_board_per_round) do
    board_numbers =
      ((board_set - 1) * number_of_board_per_round + 1)..(board_set * number_of_board_per_round)
      |> Enum.map(fn x -> x end)

    %Round{round | board_numbers: board_numbers}
  end
end
