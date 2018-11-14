defmodule Articuno.SiteRender do
  alias Articuno.FolderRep

  @build_folder_name "_build"

  @moduledoc """
  A SiteRender struct 
  """

  @doc """
  The `Articuno.SiteRender` struct holds the mid-process rendered state of a static site source. Instead of immediatly taking source and generating new files on the hard drive we instead maintain a Folder/File Tree Represtation here in memory, in the SiteRender. This allows for more pure functions and easier testing.
  It stores:
    * `:source_path` - the path to the static site on disk.
    * `:destination_rep` - the representation of the rendered site.
  """
  @enforce_keys [:source_path]
  defstruct [
    :source_path,
    destination_rep: %FolderRep{foldername: @build_folder_name, files: []}
  ]

  def build_path(site_render) do
    Path.join(site_render.source_path, site_render.destination_rep.foldername)
  end
end
