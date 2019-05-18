defmodule TransportCmsWeb.Graphql.Resolvers.Content do
  def list_transports(_parent, _args, _resolution) do
    { :ok, TransportCms.Content.list_transports() }
  end
end
