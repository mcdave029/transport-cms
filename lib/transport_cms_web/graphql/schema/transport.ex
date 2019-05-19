defmodule TransportCmsWeb.Graphql.Schema.Transport do
  use Absinthe.Schema.Notation

  alias TransportCmsWeb.Graphql.Resolvers

  import AbsintheErrorPayload.Payload

  import_types AbsintheErrorPayload.ValidationMessageTypes

  import_types TransportCmsWeb.Graphql.Types.Transport

  payload_object(:transport_payload, :transport)

  object :transport_queries do
    @desc "Get all transports"
    field :transports, list_of(:transport) do
      resolve &Resolvers.Transport.list_transports/3
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
