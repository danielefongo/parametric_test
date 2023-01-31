defmodule ParametricTestTest do
  use ExUnit.Case
  doctest ParametricTest

  test "greets the world" do
    assert ParametricTest.hello() == :world
  end
end
