defmodule BoardMetadataTest do
  use ExUnit.Case

  test "board 15 south is dealer and NS vulnerable" do
    vulnerability = BoardMetadata.vulnerability(15)
    dealer = BoardMetadata.dealer(15)

    assert vulnerability == :ns
    assert dealer == :south
  end

  test "board 23 south is dealer and all vulnerable" do
    vulnerability = BoardMetadata.vulnerability(23)
    dealer = BoardMetadata.dealer(23)

    assert vulnerability == :all
    assert dealer == :south
  end

  test "board 32 west is dealer and ew vulnerable" do
    vulnerability = BoardMetadata.vulnerability(32)
    dealer = BoardMetadata.dealer(32)

    assert vulnerability == :ew
    assert dealer == :west
  end
end
