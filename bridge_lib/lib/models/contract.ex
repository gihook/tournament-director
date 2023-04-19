defmodule Contract do
  @enforce_keys [:suit, :level, :number_of_overtricks]
  defstruct [:suit, :level, :number_of_overtricks, penalty: :none, vulnerability: :green]
end
