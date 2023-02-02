defmodule ParametricTestTest do
  use ExUnit.Case
  require ParametricTest
  import ParametricTest

  @params [{1, 2}, {3, 4}]

  setup do
    {:ok, %{c: 1}}
  end

  parametric_test "a test", {a, b} <- [{1, 2}, {3, 4}, {4, 5}], %{c: c} do
    assert a + c == b
  end

  parametric_test "a test using attributes", {a, b} <- @params, %{c: c} do
    assert a + c == b
  end
end
