defmodule BoardMetadata do
  def vulnerability(1), do: :none
  def vulnerability(2), do: :ns
  def vulnerability(3), do: :ew
  def vulnerability(4), do: :all

  def vulnerability(5), do: :ns
  def vulnerability(6), do: :ew
  def vulnerability(7), do: :all
  def vulnerability(8), do: :none

  def vulnerability(9), do: :ew
  def vulnerability(10), do: :all
  def vulnerability(11), do: :none
  def vulnerability(12), do: :ns

  def vulnerability(13), do: :all
  def vulnerability(14), do: :none
  def vulnerability(15), do: :ns
  def vulnerability(16), do: :ew

  def vulnerability(number), do: rem(number, 16) |> vulnerability

  def dealer(1), do: :north
  def dealer(2), do: :east
  def dealer(3), do: :south
  def dealer(4), do: :west

  def dealer(number), do: rem(number, 4) |> dealer
end
