defmodule Articuno.SiteInfoTest do
  use ExUnit.Case

  @example_site_path "../../example_sites/basic"

  # method/1_givenState_shouldReturnState
  test "the example SiteInfo can be read from disk" do
    site_render = %Articuno.SiteRender{source_path: @example_site_path}
    site_info = %Articuno.SiteInfo
    assert render.destination_rep.foldername == "_build"
  end
end
