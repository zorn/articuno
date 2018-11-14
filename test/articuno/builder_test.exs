defmodule Articuno.BuilderTest do
  use ExUnit.Case
  alias Articuno.{Builder, FileRep, FolderRep, SiteRender}

  @example_site_path "example_sites/basic"
  @example_output_site_path "example_sites/basic-output"

  describe "process/1" do
    test "can render the basic sample site" do
      site_render = %Articuno.SiteRender{source_path: @example_site_path}
      actual_rep = Builder.process(site_render)

      about_content = File.read!(Path.join(@example_output_site_path, "about.html"))
      index_content = File.read!(Path.join(@example_output_site_path, "index.html"))

      expected_rep = %SiteRender{
        source_path: "example_sites/basic",
        destination_rep: %FolderRep{
          foldername: "_build",
          files: [
            %FileRep{filename: "about.html", content: about_content},
            %FileRep{filename: "index.html", content: index_content}
          ]
        }
      }

      assert actual_rep == expected_rep
    end
  end
end
