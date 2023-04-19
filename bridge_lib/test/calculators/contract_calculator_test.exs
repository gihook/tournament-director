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
        suit: :clubs,
        level: 7,
        penalty: :none,
        number_of_overtricks: 0,
        vulnerability: :red
      })

    assert result == 2140
  end
end
