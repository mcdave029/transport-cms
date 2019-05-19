defmodule TransportCms.Transport do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "transports" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(transport, attrs) do
    transport
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 7)
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from trans in query,
    where: ilike(trans.name, ^wildcard_search)
  end
end
