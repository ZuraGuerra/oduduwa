defmodule Oduduwa.Repo.Migrations.CreateMambo do
  use Ecto.Migration

  def change do
    create table(:mambos) do
      add :spiritual_mailbox, :string
      add :baptismal_name, :string
      add :magic_word, :string
      add :magic_word_confirmation, :string
      add :hashed_magic_word, :string
      add :is_high_priest, :boolean, default: false

      timestamps
    end

  end
end
