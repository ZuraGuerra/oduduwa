defmodule Oduduwa.Mambo do
  use Oduduwa.Web, :model

  schema "mambos" do
    field :spiritual_mailbox, :string
    field :baptismal_name, :string
    field :magic_word, :string
    field :magic_word_confirmation, :string
    field :hashed_magic_word, :string
    field :is_high_priest, :boolean, default: false

    timestamps
  end

  @required_fields ~w(spiritual_mailbox baptismal_name magic_word magic_word_confirmation hashed_magic_word is_high_priest)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
