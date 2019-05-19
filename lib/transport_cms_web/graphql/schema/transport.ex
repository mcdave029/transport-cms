defmodule TransportCmsWeb.Graphql.Schema.Transport do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias TransportCmsWeb.Graphql.Resolvers
  alias Absinthe.Relay.Connection

  import AbsintheErrorPayload.Payload

  import_types AbsintheErrorPayload.ValidationMessageTypes

  import_types TransportCmsWeb.Graphql.Types.Transport

  payload_object(:transport_payload, :transport)

  object :transport_queries do
    @desc "Get all transports"
    connection field :transports, node_type: :transport do
      arg :query, :string
      resolve fn
        pagination_args, %{} ->
          Resolvers.Transport.list_transports(pagination_args)
      end
    end

    @desc "Get specific transport"
    field :transport, :transport_payload do
      arg :id, non_null(:id)
      resolve &Resolvers.Transport.find_transport/3
      middleware &build_payload/2
    end
  end

  object :transport_mutations do
    @desc "Create Transport"
    field :transport_create, type: :transport_payload do
      arg :input, non_null(:transport_input)

      resolve &Resolvers.Transport.create_transport/3
      middleware &build_payload/2
    end
  end
end
