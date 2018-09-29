defmodule Articuno.Initializer do
  def new_site do
    case File.open("site", [:write]) do
      {:ok, file} ->
        IO.binwrite(file, "world")
        File.close(file)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end
end
