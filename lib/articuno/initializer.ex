defmodule Articuno.Initializer do
  def new_site do
    case File.open("site.json", [:write]) do
      {:ok, file} ->
        json = Poison.encode!(%SiteDescription{title: "Mike Zornek"})
        IO.binwrite(file, json)
        File.close(file)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end
end
