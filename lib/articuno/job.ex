defmodule Articuno.Job do
  alias Articuno.FolderRep
  alias Articuno.SiteInfo

  @moduledoc """

  """
  defstruct [:site_info, :site_path, :build_path, :root_folder]

  def job(site_path) do
    %Articuno.Job{
      site_info: SiteInfo.site_info(site_path),
      site_path: site_path,
      build_path: default_build_path(site_path),
      root_folder: %FolderRep{foldername: "_build", children: []}
    }
  end

  def default_build_path(path) do
    Path.join(path, "_build")
  end
end
