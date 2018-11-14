defmodule Articuno.SiteRenderTest do
  use ExUnit.Case

  # method/1_givenState_shouldReturnState
  test "a default SiteRender should begin with a _build folder" do
    render = %Articuno.SiteRender{source_path: "/some/path"}
    assert render.destination_rep.foldername == "_build"
  end
end
