defmodule Articuno.FileRep do
  defstruct [:filename, :content]

  def render(file_rep, dir_path) do
    new_path = Path.join(dir_path, file_rep.filename)
    File.write(new_path, file_rep.content)
  end
end
