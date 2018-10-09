defmodule Articuno.FolderRep do
  defstruct [:foldername, :children]

  def render(folder_rep, dir_path) do
    new_path = Path.join(dir_path, folder_rep.foldername)
    File.mkdir!(new_path)
    process_children(folder_rep.children, new_path)
  end

  defp process_children([head | tail], path) do
    if Map.has_key?(head, :filename) do
      [Articuno.FileRep.render(head, path) | process_children(tail, path)]
    else
      [Articuno.FolderRep.render(head, path) | process_children(tail, path)]
    end
  end

  defp process_children([], _) do
    []
  end
end
