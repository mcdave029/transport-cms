defmodule TransportCms.Content do
  alias TransportCms.{ Repo, Transport }

  def list_transports() do
    Repo.all(Transport)
  end

  def find_transport(id) do
    Repo.get(Transport, id)
  end

  def create_transport(attrs \\ %{}) do
    %Transport{}
    |> Transport.changeset(attrs)
    |> Repo.insert()
  end
end
