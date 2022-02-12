defmodule Getaways.AccountsTest do
  use Getaways.DataCase, async: true

  alias Getaways.Accounts
  alias Getaways.Accounts.User

  import Getaways.AccountsFixtures
  describe "get_user/1" do
    test "returns the user with the given id" do
      user = user_fixture()
      assert user.id == Accounts.get_user(user.id).id
    end
  end

  describe "create_user/1" do
    @valid_attrs %{
      username: "some name",
      email: "some email",
      password: "some password"
    }

    test "with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.password_hash
    end

    test "with invalid data returns error changeset" do
      invalid_attrs = %{@valid_attrs | username: nil}
      assert {:error, %Ecto.Changeset{}} =
        Accounts.create_user(invalid_attrs)
    end
  end
end
