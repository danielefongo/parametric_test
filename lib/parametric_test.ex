defmodule ParametricTest do
  defmacro parametric_test(name, {:<-, _, [vars, params]}, context \\ %{}, do: body) do
    Enum.map(params, fn param ->
      quote do
        test "#{unquote(name)} #{inspect(unquote(param))}", unquote(context) do
          unquote(vars) = unquote(param)
          unquote(body)
        end
      end
    end)
  end
end
