defmodule Articuno.Builder do
  def build do
    case File.read("site") do
      {:ok, content} ->
        IO.puts("Found: #{content}")

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end
end
