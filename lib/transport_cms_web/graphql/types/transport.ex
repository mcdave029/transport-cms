defmodule TransportCmsWeb.Graphql.Types.Transport do
  use Absinthe.Schema.Notation

  object :transport do
    field :id, :id
    field :name, :string
  end

  input_object :transport_input do
    field(:name, non_null(:string))
  end
end
