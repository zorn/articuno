defmodule Articuno.CLI do
  @moduledoc """
  This module defines the behaviors to be executed based
  on the command line interface and various passed
  in arguments.
  """

  @doc """
  Executes behavior for the command line app when
  no arguments are passed in, in this case printing 
  the help message.
  """
  def main([]) do
    help()
  end

  @doc """
  Executes behavior for the command line app when
  arguments are passed in. Valid arguments are 
  `init` and `build`.
  """
  def main(args) do
    command = List.first(args)
    execute(command, args)
  end

  defp execute(command, args) do
    case command do
      "build" -> build(args)
      "init" -> init(args)
      _ -> unknown(command)
    end
  end

  defp init(args) do
    Articuno.Initializer.new_site(args)
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
