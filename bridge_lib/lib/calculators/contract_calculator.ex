defmodule ContractCalculator do
  def calculate_result(%Contract{
        suit: :clubs,
        level: level,
        number_of_overtricks: number_of_overtricks,
        vulnerability: vulnerability
      }) do
    award_for_contract = 50
    award_for_level = level * 20

    contract_points = award_for_contract + award_for_level

    award_for_overtricks = number_of_overtricks * 20

    contract_points + award_for_overtricks + calculate_game_bonus(contract_points, vulnerability) +
      calculate_slam_bonus(level, vulnerability)
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
end
