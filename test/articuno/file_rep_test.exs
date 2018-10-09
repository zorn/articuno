defmodule Articuno.FileRepTest do
  use ExUnit.Case
  doctest Articuno.FileRep

  alias Articuno.FileRep, as: FileRep

  # method/1_givenState_shouldReturnState
  test "can write a string FileRep to disk" do
    # Sample file_rep
    file_rep = %FileRep{filename: "demo.txt", content: "testing\n1 2 3"}

    # Render file_rep to disk
    {:ok, dir_path} = Temp.mkdir()
    file_path = Path.join(dir_path, file_rep.filename)
    File.write(file_path, file_rep.content)

    # Verify
    {:ok, content} = File.read(file_path)
    assert content == file_rep.content

    # Remove file system artifacts
    File.rm_rf(dir_path)
  end
end
