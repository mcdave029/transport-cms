defmodule TransportCmsWeb.Graphql.Resolvers.Transport do
  alias AbsintheErrorPayload.ValidationMessage
  alias Absinthe.Relay.Connection
  alias TransportCms.{ Repo, Transport }

  def list_transports(args) do
    search_term = get_in(args, [:query])

    Transport
    |> Transport.search(search_term)
    |> Connection.from_query(&Repo.all/1, args)
  end

  def find_transport(_parent, %{id: id}, _resolution) do
    case TransportCms.Content.find_transport(id) do
      nil -> {:ok, %ValidationMessage{field: :id, code: "not found", message: "does not exist"}}
      transport -> {:ok, transport}
    end
  end

  def create_transport(_parent, %{input: input}, _resolution) do
    case TransportCms.Content.create_transport(input) do
      {:ok, user} -> {:ok, user}
      {:error, %Ecto.Changeset{} = changeset} -> {:ok, changeset}
    end
  end
end
