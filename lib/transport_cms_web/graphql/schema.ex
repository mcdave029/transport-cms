defmodule TransportCmsWeb.Graphql.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias TransportCms.Transport

  import_types TransportCmsWeb.Graphql.Schema.Transport

  node interface do
    resolve_type fn
      %Transport{}, _ ->
        :transport
      _, _ ->
        nil
    end
  end

  query do
    import_fields :transport_queries
  end

  mutation do
    import_fields :transport_mutations
  end
end
