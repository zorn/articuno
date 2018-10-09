defmodule Articuno.Initializer do
  alias Articuno.SiteInfo, as: SiteInfo

  def new_site(_) do
    case File.open("site.json", [:write]) do
      {:ok, file} ->
        json = Poison.encode!(%SiteInfo{site_name: "Mike Zornek"})
        IO.binwrite(file, json)
        File.close(file)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end
end
