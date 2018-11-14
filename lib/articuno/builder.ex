defmodule Articuno.Builder do
  alias Articuno.{SiteRender, FileRep, FolderRep}

  def build(args) do
    %SiteRender{source_path: site_path(args)}
    |> process
  end

  def process(site_render) do
    site_render
    |> delete_build_folder

    #   |> copy_static_assests

    |> generate_page_content

    #   |> generate_post_content
    #   |> generate_json_feed
    #   |> generate_rss_feed
    #   |> render_to_file_system
  end

  defp delete_build_folder(site_render) do
    build_path = SiteRender.build_path(site_render)

    if File.exists?(build_path) do
      File.rm_rf!(build_path)
    end

    site_render
  end

  # defp copy_static_assests(job), do: job

  defp generate_page_content(site_render) do
    source_path = site_render.source_path

    # Load site info
    site_info = site_info_using_site_path(source_path)

    # load page templates
    template_path = Path.join(source_path, "templates/base.html.eex")

    # get file list of all pages
    page_path = Path.join(source_path, "pages")
    {:ok, files} = File.ls(page_path)

    # for each page import content

    page_files =
      Enum.reduce(files, [], fn file, filenames ->
        if Path.extname(file) == ".md" do
          filenames ++ [file]
        else
          filenames
        end
      end)

    # IO.puts("Page Files: #{page_files}")

    new_file_reps =
      Enum.reduce(Enum.sort(page_files), [], fn file, new_reps ->
        # IO.puts("File is #{file}")

        # render the file content inside a template
        file_path = Path.join(page_path, file)
        {:ok, content} = File.read(file_path)

        # template will need content + site info
        output = EEx.eval_file(template_path, site_name: site_info.site_name, content: content)

        # take the result and add it to the SiteRender
        # Remove .md and replace with .html
        # IO.puts("File before trim is #{file}")

        base_filename = String.trim_trailing("#{file}", Path.extname(file))
        new_filename = "#{base_filename}.html"
        new_file_rep = %FileRep{filename: new_filename, content: output}

        new_reps ++ [new_file_rep]
      end)

    new_destination_files = site_render.destination_rep.files ++ new_file_reps
    new_destination = %FolderRep{site_render.destination_rep | :files => new_destination_files}
    %SiteRender{site_render | :destination_rep => new_destination}
  end

  # defp generate_post_content(job) do
  # Load site info
  # site_info = site_info_using_site_path(site_render.source_path)

  # load page templates

  # get file list of all pages

  # sort the pages in date order

  # for each page import content

  # render that content inside a template
  # template will need content + site info + prev_page + next_page

  # take the result and add it to the SiteRender
  # end

  # defp generate_json_feed(job), do: job

  # defp generate_rss_feed(job), do: job

  # defp render_to_file_system(job), do: job

  defp site_path(args) do
    case args do
      [_, dir] -> dir
      [_] -> "."
    end
  end

  def site_info_using_site_path(site_path) do
    site_info_path = Path.join(site_path, "site-info.json")
    Poison.decode!(File.read!(site_info_path), as: %Articuno.SiteInfo{})
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
