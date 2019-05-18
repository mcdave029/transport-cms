defmodule TransportCmsWeb.Graphql.Schema do
  use Absinthe.Schema

  import AbsintheErrorPayload.Payload

  import_types AbsintheErrorPayload.ValidationMessageTypes
  import_types TransportCmsWeb.Graphql.ContentTypes

  alias TransportCmsWeb.Graphql.Resolvers
  
  payload_object(:transport_payload, :transport)

  query do
    @desc "Get all transports"
    field :transports, list_of(:transport) do
      resolve &Resolvers.Content.list_transports/3
    end

    @desc "Get specific transport"
    field :transport, :transport do
      arg :id, non_null(:id)
      resolve &Resolvers.Content.find_transport/3
    end
  end

  mutation do
    @desc "Create Transport"
    field :transport_create, type: :transport_payload do
      arg :name, non_null(:string)

      resolve &Resolvers.Content.create_transport/3
      middleware &build_payload/2
    end
  end
end
