defmodule Articuno.FolderRepTest do
  use ExUnit.Case
  doctest Articuno.FolderRep

  alias Articuno.FileRep
  alias Articuno.FolderRep

  # method/1_givenState_shouldReturnState
  test "can write a FolderRep to disk" do
    folder_rep = %FolderRep{
      foldername: "website",
      children: [
        %FolderRep{
          foldername: "css",
          children: [
            %FileRep{filename: "style.css", content: "p{}"}
          ]
        },
        %FolderRep{
          foldername: "js",
          children: [
            %FileRep{filename: "app.js", content: "alert();"}
          ]
        },
        %FileRep{filename: "index.html", content: "<h1>Hello world.</h1>"}
      ]
    }

    # Render file_rep to disk
    {:ok, dir_path} = Temp.mkdir()
    # IO.inspect(folder_rep)
    # IO.inspect(dir_path)
    FolderRep.render(folder_rep, dir_path)

    # Verify
    assert File.exists?(Path.join(dir_path, "website/css/style.css"))
    assert File.exists?(Path.join(dir_path, "website/js/app.js"))
    assert File.exists?(Path.join(dir_path, "website/index.html"))

    # Remove file system artifacts
    File.rm_rf(dir_path)
  end
end
