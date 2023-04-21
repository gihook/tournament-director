defmodule MatchpointCalculator do
  def calculate_scores(%Board{entries: entries} = board) do
    updated_entries =
      entries
      |> Enum.map(fn contract ->
        %{ns_score: ns_score, ew_score: ew_score} = calculate_score(contract, entries)
        %Contract{contract | ns_score: ns_score - 1, ew_score: ew_score - 1}
      end)

    %Board{board | entries: updated_entries}
  end

  defp calculate_score(contract, entries) do
    entries
    |> Enum.reduce(%{ns_score: 0, ew_score: 0}, fn entry_contract,
                                                   %{ns_score: ns_score, ew_score: ew_score} ->
      %{
        ns_score: ns_score + matchpoints(contract.score, entry_contract.score),
        ew_score: ew_score + matchpoints(entry_contract.score, contract.score)
      }
    end)
  end

  defp matchpoints(a, b) when a > b, do: 2
  defp matchpoints(a, b) when a == b, do: 1
  defp matchpoints(a, b) when a < b, do: 0
end
