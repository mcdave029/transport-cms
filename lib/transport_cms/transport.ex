defmodule TransportCms.Transport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transports" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(transport, attrs) do
    transport
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
