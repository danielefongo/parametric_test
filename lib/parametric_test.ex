defmodule ParametricTest do
  defmacro parametric_test(name, params, do: body) do
    setup_test(name, params, %{}, body)
  end

  defmacro parametric_test(name, params, context, do: body) do
    setup_test(name, params, context, body)
  end

  def setup_test(name, {:<-, _, [vars, params = {:@, _, [{param, _, _}]}]}, context, body) do
    quote do
      Module.get_attribute(__MODULE__, unquote(param))
      |> Enum.with_index()
      |> Enum.map(fn {param, idx} ->
        @parametric_test_idx idx
        test "#{unquote(name)} #{inspect(idx + 1)}", unquote(context) do
          unquote(vars) = Enum.at(unquote(params), @parametric_test_idx)
          unquote(body)
        end
      end)
    end
  end

  def setup_test(name, {:<-, _, [vars, params]}, context, body) do
    params
    |> Enum.with_index()
    |> Enum.map(fn {param, idx} ->
      quote do
        test "#{unquote(name)} #{inspect(unquote(idx + 1))}", unquote(context) do
          unquote(vars) = unquote(param)
          unquote(body)
        end
      end
    end)
  end
end
