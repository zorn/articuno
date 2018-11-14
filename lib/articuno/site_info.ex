defmodule Articuno.SiteInfo do
  @derive [Poison.Encoder]

  @doc """
  The `Articuno.SiteInfo` struct. It represents the metadata for a site.
  It stores:
    * `:site_name` - the name of the site as a string
    * `:site_description` - a short description of the site as a string, optional
    * `:author_email` - the default email of the author as a string for  posts that do not define an author, optional
    * `:author_name` - the default name of the author as a string for  posts that do not define an author, optional
  """
  defstruct [
    :site_name,
    :site_description,
    :author_email,
    :author_name
  ]
end
