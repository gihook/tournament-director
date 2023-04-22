defmodule Movement do
  defstruct [:type, number_of_boards: 0, tables: []]

  def get_round_info(%Movement{tables: tables} = movement, number) do
    tables_with_one_round =
      tables
      |> Enum.map(fn %Table{rounds: rounds} = table ->
        filtered_rounds =
          rounds |> Enum.filter(fn %{number: round_number} -> round_number == number end)

        %Table{table | rounds: filtered_rounds}
      end)

    %Movement{movement | tables: tables_with_one_round}
  end

  def get_round_info_for_pair(%Movement{} = movement, round_number, pair_id) do
    %Movement{tables: tables} = get_round_info(movement, round_number)

    tables
    |> Enum.filter(fn %Table{rounds: [round | _]} ->
      round.ns_pair_id == pair_id || round.ew_pair_id == pair_id
    end)
    |> Enum.at(0)
  end
end
