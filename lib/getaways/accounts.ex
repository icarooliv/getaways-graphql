defmodule Getaways.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Getaways.Repo

  alias Getaways.Accounts.User

  @doc """
  Returns the user with the given `id`.

  Returns `nil` if the user does not exist.
  """
  def get_user(id) do
    Repo.get(User, id)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
