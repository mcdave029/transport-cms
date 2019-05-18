defmodule TransportCmsWeb.Graphql.Schema do
  use Absinthe.Schema
  import_types TransportCmsWeb.Graphql.ContentTypes

  alias TransportCmsWeb.Graphql.Resolvers

  query do
    @desc "Get all transports"
    field :transports, list_of(:transport) do
      resolve &Resolvers.Content.list_transports/3
    end
  end
end
