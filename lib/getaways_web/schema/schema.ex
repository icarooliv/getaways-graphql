defmodule GetawaysWeb.Schema.Schema do
  use Absinthe.Schema
  alias Getaways.{Vacation, Accounts}
  alias GetawaysWeb.Resolvers
  alias GetawaysWeb.Schema.Middleware
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  import_types(Absinthe.Type.Custom)

  query do
    @desc "Get a place by its slug"
    field :place, :place do
      arg(:slug, non_null(:string))

      resolve(&Resolvers.Vacation.place/3)
    end

    @desc "Get a list of places"
    field :places, list_of(:place) do
      arg(:limit, :integer)
      arg(:order, type: :sort_order, default_value: :asc)
      arg(:filter, :place_filter)
      resolve(&Resolvers.Vacation.places/3)
    end

    @desc "me"
    field :me, :user do
      resolve &Resolvers.Accounts.me/3
    end
  end

  mutation do
    @desc "Create a booking for a place"
    field :create_booking, :booking do
      arg :place_id, non_null(:id)
      arg :start_date, non_null(:date)
      arg :end_date, non_null(:date)
      middleware Middleware.Authenticate
      resolve &Resolvers.Vacation.create_booking/3
    end

    @desc "Cancel a booking"
    field :cancel_booking, :booking do
      arg :booking_id, non_null(:id)
      middleware Middleware.Authenticate
      resolve &Resolvers.Vacation.cancel_booking/3
    end

    @desc "Create a new review for a place"
      field :create_review, :review do
        arg :place_id, non_null(:id)
        arg :rating, non_null(:integer)
        arg :comment, :string
        middleware Middleware.Authenticate
        resolve &Resolvers.Vacation.create_review/3
    end

    @desc "Create a user account"
      field :signup, :session do
        arg :email, non_null(:string)
        arg :password, non_null(:string)
        arg :username, non_null(:string)
        resolve &Resolvers.Accounts.signup/3
    end

    @desc "Sign in a user"
    field :signin, :session do
      arg :username, non_null(:string)
      arg :password, non_null(:string)
      resolve &Resolvers.Accounts.signin/3
    end
  end

  subscription do
    @desc "Subscribe booking changes to a place"
    field :booking_change, :booking do
      arg :place_id, non_null(:id)
      config fn args, _info ->
        {:ok, topic: args.place_id}
      end
    end
  end

  input_object :place_filter do
    field :matching, :string
    field :wifi, :boolean
    field :pet_friendly, :boolean
    field :pool, :boolean
    field :guest_count, :integer
    field :available_between, :date_range
  end

  input_object :date_range do
    field :start_date, non_null(:date)
    field :end_date, non_null(:date)
  end

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  object :place do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :location, non_null(:string)
    field :slug, non_null(:string)
    field :description, non_null(:string)
    field :max_guests, non_null(:integer)
    field :pet_friendly, non_null(:boolean)
    field :pool, non_null(:boolean)
    field :wifi, non_null(:boolean)
    field :price_per_night, non_null(:decimal)
    field :image, non_null(:string)
    field :image_thumbnail, non_null(:string)

    field :bookings, list_of(:booking) do
      arg(:limit, type: :integer, default_value: 100)
      resolve(dataloader(Vacation, :bookings, args: %{scope: :place}))
    end

    field :reviews, list_of(:review), resolve: dataloader(Vacation)
  end

  object :booking do
    field :id, non_null(:id)
    field :start_date, non_null(:date)
    field :end_date, non_null(:date)
    field :state, non_null(:string)
    field :total_price, non_null(:decimal)
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :place, non_null(:place), resolve: dataloader(Vacation)
  end

  object :review do
    field :id, non_null(:id)
    field :rating, non_null(:integer)
    field :comment, non_null(:string)
    field :inserted_at, non_null(:naive_datetime)
    field :user, non_null(:user), resolve: dataloader(Accounts)
    field :place, non_null(:place), resolve: dataloader(Vacation)
  end

  object :user do
    field :username, non_null(:string)
    field :email, non_null(:string)

    field :bookings, list_of(:booking),
      resolve: dataloader(Vacation, :bookings, args: %{scope: :user})

    field :reviews, list_of(:review), resolve: dataloader(Vacation)
  end

  object :session do
    field :user, non_null(:user)
    field :token, non_null(:string)
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Vacation, Vacation.datasource())
      |> Dataloader.add_source(Accounts, Accounts.datasource())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
