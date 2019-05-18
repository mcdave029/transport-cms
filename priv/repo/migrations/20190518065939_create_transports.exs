defmodule TransportCms.Repo.Migrations.CreateTransports do
  use Ecto.Migration

  def change do
    create table(:transports) do
      add :name, :string

      timestamps()
    end

  end
end
