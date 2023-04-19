defmodule ContractCalculator do
  def calculate_result(
        %Contract{
          level: level,
          vulnerability: vulnerability
        } = contract
      ) do
    contract_points = calculate_contract_points(contract)
    award_for_overtricks = calculate_overtirck_points(contract)
    game_bonus = calculate_game_bonus(contract_points, vulnerability)
    slam_bonus = calculate_slam_bonus(level, vulnerability)

    contract_points + award_for_overtricks + game_bonus + slam_bonus
  end

  defp calculate_contract_points(%Contract{suit: suit, level: level}) do
    award_for_contract = award_for_contract(suit)
    award_for_level = level * trick_value(suit)

    award_for_contract + award_for_level
  end

  defp award_for_contract(:notrump), do: 60
  defp award_for_contract(_suit), do: 50

  defp calculate_overtirck_points(%Contract{
         number_of_overtricks: number_of_overtricks,
         suit: suit
       }) do
    number_of_overtricks * trick_value(suit)
  end

  defp calculate_game_bonus(contract_points, vulnerability) when contract_points >= 150 do
    map = %{red: 450, green: 250}
    map[vulnerability]
  end

  defp calculate_game_bonus(_contract_points, _vulnerability), do: 0

  defp calculate_slam_bonus(6, :green), do: 500
  defp calculate_slam_bonus(6, :red), do: 750
  defp calculate_slam_bonus(7, :green), do: 1000
  defp calculate_slam_bonus(7, :red), do: 1500
  defp calculate_slam_bonus(_level, _vulnerability), do: 0

  defp trick_value(:clubs), do: 20
  defp trick_value(:diamonds), do: 20
  defp trick_value(:hearts), do: 30
  defp trick_value(:spades), do: 30
  defp trick_value(:notrump), do: 30
end
