defmodule Contract do
  @enforce_keys [:suit, :level, :number_of_overtricks]
  defstruct [
    :ns_pair,
    :ew_pair,
    :declearer,
    :suit,
    :level,
    :number_of_overtricks,
    :lead,
    :score,
    penalty: :none,
    vulnerability: :green
  ]
end
