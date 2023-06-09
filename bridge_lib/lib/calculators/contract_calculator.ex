defmodule ContractCalculator do
  def calculate_result(%Contract{suit: :pass}), do: 0

  def calculate_result(
        %Contract{
          number_of_overtricks: number_of_overtricks
        } = contract
      )
      when number_of_overtricks >= 0 do
    calculate_made_contract(contract)
  end

  def calculate_result(contract), do: calculate_defeted_contract(contract)

  defp calculate_defeted_contract(
         %Contract{
           penalty: :redoubled
         } = contract
       ) do
    calculate_defeted_contract(%Contract{contract | penalty: :doubled}) * 2
  end

  defp calculate_defeted_contract(%Contract{
         penalty: :doubled,
         number_of_overtricks: number_of_overtricks,
         vulnerability: vulnerability
       }) do
    map = %{
      green: [100, 300, 500, 800, 1100, 1400, 1700, 2000, 2300, 2600, 2900, 3200, 3500],
      red: [200, 500, 800, 1100, 1400, 1700, 2000, 2300, 2600, 2900, 3200, 3500, 3800]
    }

    index = number_of_overtricks * -1 - 1
    value = map[vulnerability] |> Enum.at(index)
    value * -1
  end

  defp calculate_defeted_contract(%Contract{
         number_of_overtricks: number_of_overtricks,
         vulnerability: vulnerability
       }) do
    map = %{red: 100, green: 50}
    number_of_overtricks * map[vulnerability]
  end

  defp calculate_made_contract(
         %Contract{
           level: level,
           vulnerability: vulnerability,
           penalty: penalty
         } = contract
       ) do
    contract_points = calculate_contract_points(contract)
    award_for_overtricks = calculate_overtirck_points(contract)
    penalty_bonus = calculate_penalty_bonus(penalty)
    game_bonus = calculate_game_bonus(contract_points, vulnerability)
    slam_bonus = calculate_slam_bonus(level, vulnerability)

    contract_points + penalty_bonus + game_bonus + slam_bonus + award_for_overtricks
  end

  defp calculate_penalty_bonus(:redoubled), do: 100
  defp calculate_penalty_bonus(:doubled), do: 50
  defp calculate_penalty_bonus(_penalty), do: 0

  defp calculate_contract_points(%Contract{penalty: :redoubled} = contract) do
    calculate_contract_points(%Contract{contract | penalty: :none}) * 4
  end

  defp calculate_contract_points(%Contract{penalty: :doubled} = contract) do
    calculate_contract_points(%Contract{contract | penalty: :none}) * 2
  end

  defp calculate_contract_points(%Contract{suit: suit, level: level}) do
    award_for_contract = award_for_contract(suit)
    award_for_level = level * trick_value(suit)

    award_for_contract + award_for_level
  end

  defp award_for_contract(:notrump), do: 10
  defp award_for_contract(_suit), do: 0

  defp calculate_overtirck_points(
         %Contract{number_of_overtricks: number_of_overtricks} = contract
       ) do
    number_of_overtricks * overtrick_value(contract)
  end

  defp overtrick_value(%Contract{penalty: :redoubled, vulnerability: :red}), do: 400
  defp overtrick_value(%Contract{penalty: :redoubled, vulnerability: :green}), do: 200
  defp overtrick_value(%Contract{penalty: :doubled, vulnerability: :red}), do: 200
  defp overtrick_value(%Contract{penalty: :doubled, vulnerability: :green}), do: 100
  defp overtrick_value(%Contract{suit: suit}), do: trick_value(suit)

  defp calculate_game_bonus(contract_points, vulnerability) when contract_points >= 100 do
    map = %{red: 500, green: 300}
    map[vulnerability]
  end

  defp calculate_game_bonus(_contract_points, _vulnerability), do: 50

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
