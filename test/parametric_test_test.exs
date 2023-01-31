defmodule ParametricTestTest do
  use ExUnit.Case
  require ParametricTest
  import ParametricTest

  setup do
    {:ok, %{c: 1}}
  end

  parametric_test "a test", {a, b} <- [{1, 2}, {3, 4}, {4, 4}], %{c: c} do
    assert a + c == b
  end
end
