defmodule ContractCalculatorTest do
  use ExUnit.Case
  doctest BridgeLib

  test "1 cl | +1 = 90" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 1,
        penalty: :none,
        number_of_overtricks: 1
      })

    assert result == 90
  end

  test "3 cl | +1 = 130" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 3,
        penalty: :none,
        number_of_overtricks: 1
      })

    assert result == 130
  end

  test "5 cl | +2 = 440" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 5,
        penalty: :none,
        number_of_overtricks: 2
      })

    assert result == 440
  end

  test "5 cl | +1 | vulnerable = 620" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 5,
        penalty: :none,
        number_of_overtricks: 1,
        vulnerability: :red
      })

    assert result == 620
  end

  test "6 cl | = | vulnerable = 1370" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 6,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :red
      })

    assert result == 1370
  end

  test "6 cl | +1 | non vulnerable = 940" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 6,
        penalty: :none,
        number_of_overtricks: 1,
        vulnerability: :green
      })

    assert result == 940
  end

  test "7 cl | = | non vulnerable = 1440" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 7,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :green
      })

    assert result == 1440
  end

  test "7 diamonds | = | vulnerable = 2140" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :diamonds,
        level: 7,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :red
      })

    assert result == 2140
  end

  test "2 hearts | +3 | vulnerable = 200" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :hearts,
        level: 2,
        penalty: :none,
        number_of_overtricks: 3,
        vulnerability: :red
      })

    assert result == 200
  end

  test "5 spades | +2 | vulnerable = 710" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :spades,
        level: 5,
        penalty: :none,
        number_of_overtricks: 2,
        vulnerability: :red
      })

    assert result == 710
  end

  test "6 spades | +1 | non vulnerable = 1010" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :spades,
        level: 6,
        penalty: :none,
        number_of_overtricks: 1,
        vulnerability: :green
      })

    assert result == 1010
  end

  test "7 hearts | = | vulnerable = 2210" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :hearts,
        level: 7,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :red
      })

    assert result == 2210
  end

  test "2 NT | = | vulnerable = 120" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :notrump,
        level: 2,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :red
      })

    assert result == 120
  end

  test "7 NT | = | vulnerable = 2220" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :notrump,
        level: 7,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :red
      })

    assert result == 2220
  end

  test "7 NT | -1 | vulnerable = -100" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :notrump,
        level: 7,
        penalty: :none,
        number_of_overtricks: -1,
        vulnerability: :red
      })

    assert result == -100
  end

  test "3 clubs | -3 | non vulnerable = -150" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 3,
        penalty: :none,
        number_of_overtricks: -3,
        vulnerability: :green
      })

    assert result == -150
  end

  test "2 clubs doubled | -3 | non vulnerable = -500" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 2,
        penalty: :doubled,
        number_of_overtricks: -3,
        vulnerability: :green
      })

    assert result == -500
  end

  test "5 clubs doubled | -7 | vulnerable = -2000" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 5,
        penalty: :doubled,
        number_of_overtricks: -7,
        vulnerability: :red
      })

    assert result == -2000
  end

  test "2 clubs doubled | -2 | vulnerable = -500" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 2,
        penalty: :doubled,
        number_of_overtricks: -2,
        vulnerability: :red
      })

    assert result == -500
  end

  test "2 clubs redoubled | -8 | vulnerable = -4600" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 2,
        penalty: :redoubled,
        number_of_overtricks: -8,
        vulnerability: :red
      })

    assert result == -4600
  end

  test "2 clubs redoubled | -2 | non vulnerable = -600" do
    result =
      ContractCalculator.calculate_result(%Contract{
        suit: :clubs,
        level: 2,
        penalty: :redoubled,
        number_of_overtricks: -2,
        vulnerability: :green
      })

    assert result == -600
  end
end
