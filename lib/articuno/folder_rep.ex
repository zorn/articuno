defmodule Articuno.FolderRep do
  defstruct [:foldername, :files]

  def render(folder_rep, folder_path) do
    new_path = Path.join(folder_path, folder_rep.foldername)
    File.mkdir!(new_path)
    render_files(folder_rep.files, new_path)
  end

  defp render_files([head | tail], path) do
    if Map.has_key?(head, :filename) do
      [Articuno.FileRep.render(head, path) | render_files(tail, path)]
    else
      [Articuno.FolderRep.render(head, path) | render_files(tail, path)]
    end
  end

  defp render_files([], _) do
    []
  end
end
