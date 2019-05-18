defmodule TransportCms.Content do
  alias TransportCms.Repo
  alias TransportCms.Transport

  def list_transports() do
    Repo.all(Transport)
  end

  def find_transport(id) do
    Repo.get(Transport, id)
  end
end
