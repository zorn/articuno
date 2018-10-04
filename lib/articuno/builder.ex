defmodule Articuno.Builder do
  def build(args) do
    dir = directoryFromArguments(args)
    sitePath = Path.join(dir, "site.json")
    buildPath = Path.join(dir, "_build")
    IO.puts("sitePath #{sitePath}")

    case File.read(sitePath) do
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

        exportSite(buildPath, indexContent)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end

  defp exportSite(path, indexContent) do
    File.mkdir!(path)
    IO.puts("exportSite path #{path}")
    indexPath = Path.join(path, "index.html")
    IO.puts("exportSite indexPath #{indexPath}")

    case File.open(indexPath, [:write]) do
      {:ok, file} ->
        IO.binwrite(file, indexContent)
        File.close(file)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end

  defp directoryFromArguments(args) do
    case args do
      [_, dir] -> dir
      [_] -> "."
    end
  end
end
