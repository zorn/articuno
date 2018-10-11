defmodule Articuno.Builder do
  alias Articuno.FileSystemTools
  alias Articuno.SiteInfo
  alias Articuno.FolderRep
  alias Articuno.Job

  def build(args) do
    args
    |> create_job
    |> process
  end

  def process(job) do
    job
    |> FileSystemTools.delete_build_folder()
    |> copy_static_assests
    |> generate_page_content
    |> generate_post_content
    |> generate_json_feed
    |> generate_rss_feed
    |> render_to_file_system
  end

  defp create_job(args) do
    site_path = Path.join(site_folder(args), "site.json")
    build_path = Path.join(site_folder(args), "_build")
    {:ok, content} = File.read(site_path)
    site_info = Poison.decode!(content, as: %SiteInfo{})
    root_folder = %FolderRep{foldername: "export", children: []}

    %Job{
      site_info: site_info,
      site_path: site_path,
      build_path: build_path,
      root_folder: root_folder
    }
  end

  defp copy_static_assests(job), do: job

  defp generate_page_content(job), do: job

  defp generate_post_content(job), do: job

  defp generate_json_feed(job), do: job

  defp generate_rss_feed(job), do: job

  defp render_to_file_system(job), do: job

  defp site_folder(args) do
    case args do
      [_, dir] -> dir
      [_] -> "."
    end
  end

  # find site_info
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

  #   dir = directoryFromArguments(args)

  #   sitePath = Path.join(dir, "site.json")
  #   buildPath = Path.join(dir, "_build")
  #   IO.puts("sitePath #{sitePath}")

  #   case File.read(sitePath) do
  #     {:ok, content} ->
  #       site = Poison.decode!(content, as: %SiteInfo{})

  #       indexTemplatePath = Path.join(dir, "templates/base.html.eex")
  #       exportString = EEx.eval_file(indexTemplatePath, site_name: site.site_name)
  #       exportSite(buildPath, exportString)

  #     {:error, reason} ->
  #       IO.puts("Failed building site, #{reason}")
  #   end
  # end

  # defp exportSite(path, indexContent) do
  #   # Clear build cache
  #   if File.exists?(path) do
  #     File.rm_rf!(path)
  #   end

  #   # Make build folder
  #   File.mkdir!(path)
  #   IO.puts("exportSite path #{path}")
  #   indexPath = Path.join(path, "index.html")
  #   IO.puts("exportSite indexPath #{indexPath}")

  #   # open index page
  #   case File.open(indexPath, [:write]) do
  #     {:ok, file} ->
  #       IO.binwrite(file, indexContent)
  #       File.close(file)

  #     {:error, reason} ->
  #       IO.puts("Failed building site, #{reason}")
  #   end
  # end
end
