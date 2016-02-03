defmodule Oduduwa.MamboController do
  use Oduduwa.Web, :controller

  alias Oduduwa.Mambo

  plug :scrub_params, "mambo" when action in [:create, :update]

  def index(conn, _params) do
    mambos = Repo.all(Mambo)
    render(conn, "index.html", mambos: mambos)
  end

  def new(conn, _params) do
    changeset = Mambo.changeset(%Mambo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mambo" => mambo_params}) do
    changeset = Mambo.changeset(%Mambo{}, mambo_params)

    case Repo.insert(changeset) do
      {:ok, _mambo} ->
        conn
        |> put_flash(:info, "Mambo created successfully.")
        |> redirect(to: mambo_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mambo = Repo.get!(Mambo, id)
    render(conn, "show.html", mambo: mambo)
  end

  def edit(conn, %{"id" => id}) do
    mambo = Repo.get!(Mambo, id)
    changeset = Mambo.changeset(mambo)
    render(conn, "edit.html", mambo: mambo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mambo" => mambo_params}) do
    mambo = Repo.get!(Mambo, id)
    changeset = Mambo.changeset(mambo, mambo_params)

    case Repo.update(changeset) do
      {:ok, mambo} ->
        conn
        |> put_flash(:info, "Mambo updated successfully.")
        |> redirect(to: mambo_path(conn, :show, mambo))
      {:error, changeset} ->
        render(conn, "edit.html", mambo: mambo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mambo = Repo.get!(Mambo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mambo)

    conn
    |> put_flash(:info, "Mambo deleted successfully.")
    |> redirect(to: mambo_path(conn, :index))
  end
end
