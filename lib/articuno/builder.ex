defmodule Articuno.Builder do
  def build do
    case File.read("site.json") do
      {:ok, content} ->
        site = Poison.decode!(content, as: %SiteDescription{})

        indexContent = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <title>#{site.title}</title>
        </head>
        <body>
          <p>No content, yet.</p>
        </body>
        </html>
        """

        exportSite(indexContent)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end

  defp exportSite(indexContent) do
    case File.open("_build/index.html", [:write]) do
      {:ok, file} ->
        IO.binwrite(file, indexContent)
        File.close(file)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end
end
