defmodule TransportCms.Content do
  alias TransportCms.Repo
  alias TransportCms.Transport

  def list_transports() do
    Repo.all(Transport)
  end
end
