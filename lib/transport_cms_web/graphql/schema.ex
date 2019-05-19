defmodule TransportCmsWeb.Graphql.Schema do
  use Absinthe.Schema

  import_types TransportCmsWeb.Graphql.Schema.Transport

  query do
    import_fields :transport_queries
  end

  mutation do
    import_fields :transport_mutations
  end
end
