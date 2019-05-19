defmodule TransportCmsWeb.Graphql.Types.Transport do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :transport do
    field :id, :id
    field :name, :string
  end

  connection node_type: :transport

  input_object :transport_input do
    field(:name, non_null(:string))
  end
end
