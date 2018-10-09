defmodule Articuno.Builder do
  alias Articuno.SiteInfo, as: SiteInfo

  defmodule Job do
    defstruct [:site_info, :site_path, :build_path]
  end

  def build(args) do
    # make path to site file
    # make path to build folder
    # read site info
    # delete build folder
    # make new empty folder
    # copy static assets
    # generate pages
    # generate posts
    # generate json feed
    # generate rss feed

    dir = directoryFromArguments(args)

    sitePath = Path.join(dir, "site.json")
    buildPath = Path.join(dir, "_build")
    IO.puts("sitePath #{sitePath}")

    case File.read(sitePath) do
      {:ok, content} ->
        site = Poison.decode!(content, as: %SiteInfo{})

        indexTemplatePath = Path.join(dir, "templates/base.html.eex")
        exportString = EEx.eval_file(indexTemplatePath, site_name: site.site_name)
        exportSite(buildPath, exportString)

      {:error, reason} ->
        IO.puts("Failed building site, #{reason}")
    end
  end

  defp exportSite(path, indexContent) do
    # Clear build cache
    if File.exists?(path) do
      File.rm_rf!(path)
    end

    # Make build folder
    File.mkdir!(path)
    IO.puts("exportSite path #{path}")
    indexPath = Path.join(path, "index.html")
    IO.puts("exportSite indexPath #{indexPath}")

    # open index page
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
