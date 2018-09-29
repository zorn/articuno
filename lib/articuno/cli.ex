defmodule Articuno.CLI do
  def main([]) do
    help()
  end

  def main(args) do
    command = List.first(args)

    case command do
      "build" ->
        build()

      "init" ->
        init()

      _ ->
        unknown(command)
    end
  end

  defp init do
    Articuno.Initializer.new_site()
  end

  defp build do
    Articuno.Builder.build()
  end

  defp help() do
    IO.puts("Please add a command like `init` or `build`.")
  end

  defp unknown(command) do
    IO.puts("Unknown command `#{command}`.")
    help()
  end
end
