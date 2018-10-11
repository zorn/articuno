defmodule Articuno.FileSystemToolsTest do
  use ExUnit.Case
  doctest Articuno.FileSystemTools

  alias Articuno.FileSystemTools
  alias Articuno.Job

  test "can delete a build folder" do
    # Generate a path to a temp build folder
    {:ok, dir_path} = Temp.mkdir()
    build_path = dir_path
    job = %Job{build_path: build_path}

    # Generate a path to a temp build artifact and populate it
    temp_build_artifact_filename = "junk.txt"
    temp_build_artifact_path = Path.join(dir_path, temp_build_artifact_filename)
    File.write(temp_build_artifact_path, "dummy build stuff")

    # Verify population content
    {:ok, content} = File.read(temp_build_artifact_path)
    assert content == "dummy build stuff"

    # Verify it's non empty
    {:ok, file_list} = File.ls(job.build_path)
    assert length(file_list) == 1

    # Clean the build_path
    FileSystemTools.delete_build_folder(job)

    # Verify the build folder is gone
    assert File.exists?(job.build_path) == false
  end
end
