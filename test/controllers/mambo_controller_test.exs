defmodule Oduduwa.MamboControllerTest do
  use Oduduwa.ConnCase

  alias Oduduwa.Mambo
  @valid_attrs %{baptismal_name: "some content", hashed_magic_word: "some content", is_high_priest: true, magic_word: "some content", magic_word_confirmation: "some content", spiritual_mailbox: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mambo_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing mambos"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mambo_path(conn, :new)
    assert html_response(conn, 200) =~ "New mambo"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mambo_path(conn, :create), mambo: @valid_attrs
    assert redirected_to(conn) == mambo_path(conn, :index)
    assert Repo.get_by(Mambo, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mambo_path(conn, :create), mambo: @invalid_attrs
    assert html_response(conn, 200) =~ "New mambo"
  end

  test "shows chosen resource", %{conn: conn} do
    mambo = Repo.insert! %Mambo{}
    conn = get conn, mambo_path(conn, :show, mambo)
    assert html_response(conn, 200) =~ "Show mambo"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mambo_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mambo = Repo.insert! %Mambo{}
    conn = get conn, mambo_path(conn, :edit, mambo)
    assert html_response(conn, 200) =~ "Edit mambo"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mambo = Repo.insert! %Mambo{}
    conn = put conn, mambo_path(conn, :update, mambo), mambo: @valid_attrs
    assert redirected_to(conn) == mambo_path(conn, :show, mambo)
    assert Repo.get_by(Mambo, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mambo = Repo.insert! %Mambo{}
    conn = put conn, mambo_path(conn, :update, mambo), mambo: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mambo"
  end

  test "deletes chosen resource", %{conn: conn} do
    mambo = Repo.insert! %Mambo{}
    conn = delete conn, mambo_path(conn, :delete, mambo)
    assert redirected_to(conn) == mambo_path(conn, :index)
    refute Repo.get(Mambo, mambo.id)
  end
end
