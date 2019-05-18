defmodule TransportCmsWeb.Graphql.ContentTypes do
  use Absinthe.Schema.Notation

  object :transport do
    field :id, :id
    field :name, :string
  end
end
