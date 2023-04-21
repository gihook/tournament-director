defmodule Board do
  defstruct [:number, :dealer, :vulnerability, card_set: %CardSet{}, entries: []]

  def initialize(number) do
    initialize(number, %CardSet{})
  end

  def initialize(number, card_set) do
    %Board{
      number: number,
      dealer: BoardMetadata.dealer(number),
      vulnerability: BoardMetadata.vulnerability(number),
      card_set: card_set
    }
  end

  def add_contract(
        %Board{entries: entiries, vulnerability: vulnerability} = board,
        %Contract{declearer: declearer, suit: _suit, level: _level} = contract
      ) do
    contract_vulnerability = get_vulnerability(vulnerability, declearer)
    updated_contract = %Contract{contract | vulnerability: contract_vulnerability}
    score = ContractCalculator.calculate_result(updated_contract) * sign(declearer)
    updated_contract = %Contract{updated_contract | score: score}
    updated_entries = [updated_contract | entiries]
    %Board{board | entries: updated_entries}
  end

  defp get_vulnerability(:ns, :north), do: :red
  defp get_vulnerability(:ns, :south), do: :red
  defp get_vulnerability(:ew, :east), do: :red
  defp get_vulnerability(:ew, :west), do: :red
  defp get_vulnerability(_, _), do: :green

  defp sign(:north), do: 1
  defp sign(:south), do: 1
  defp sign(:east), do: -1
  defp sign(:west), do: -1
end
