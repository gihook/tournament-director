defmodule BridgeLibTest do
  use ExUnit.Case
  doctest BridgeLib

  test "greets the world" do
    assert BridgeLib.hello() == :world
  end
end
