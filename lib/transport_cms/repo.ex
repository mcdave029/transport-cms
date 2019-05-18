defmodule TransportCms.Repo do
  use Ecto.Repo,
    otp_app: :transport_cms,
    adapter: Ecto.Adapters.Postgres
end
