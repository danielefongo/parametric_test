defmodule ParametricTest do
  defmacro parametric_test(name, {:<-, _, [vars, params]}, do: body) do
    Enum.map(params, fn param ->
      quote do
        test "#{unquote(name)} #{inspect(unquote(param))}" do
          unquote(vars) = unquote(param)
          unquote(body)
        end
      end
    end)
  end
end
