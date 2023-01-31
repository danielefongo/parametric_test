defmodule ParametricTestTest do
  use ExUnit.Case
  require ParametricTest
  import ParametricTest

  parametric_test "a test", {a, b} <- [{1, 2}, {3, 4}, {4, 4}] do
    assert a + 1 == b
  end
end
