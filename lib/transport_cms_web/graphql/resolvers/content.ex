defmodule TransportCmsWeb.Graphql.Resolvers.Content do
  def list_transports(_parent, _args, _resolution) do
    { :ok, TransportCms.Content.list_transports() }
  end

  def find_transport(_parent, %{id: id}, _resolution) do
    case TransportCms.Content.find_transport(id) do
      nil ->
        { :error, "Transport ID #{id} not found!"}
      transport ->
        { :ok, transport }
    end
  end
end
