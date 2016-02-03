defmodule Oduduwa.MamboTest do
  use Oduduwa.ModelCase

  alias Oduduwa.Mambo

  @valid_attrs %{baptismal_name: "some content", hashed_magic_word: "some content", is_high_priest: true, magic_word: "some content", magic_word_confirmation: "some content", spiritual_mailbox: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mambo.changeset(%Mambo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mambo.changeset(%Mambo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
