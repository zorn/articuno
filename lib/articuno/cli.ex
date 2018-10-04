defmodule Articuno.CLI do
  def main([]) do
    help()
  end

  def main(args) do
    command = List.first(args)

    case command do
      "build" ->
        build(args)

      "init" ->
        init()

      _ ->
        unknown(command)
    end
  end

  defp init do
    Articuno.Initializer.new_site()
  end

  defp build(args) do
    Articuno.Builder.build(args)
  end

  defp help() do
    IO.puts("Please add a command like `init` or `build`.")
  end

  defp unknown(command) do
    IO.puts("Unknown command `#{command}`.")
    help()
  end
end
