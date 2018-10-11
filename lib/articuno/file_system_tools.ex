defmodule Articuno.FileSystemTools do
  # alias Articuno.Job

  def delete_build_folder(job) do
    if File.exists?(job.build_path) do
      File.rm_rf!(job.build_path)
    end
  end
end
