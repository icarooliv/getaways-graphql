# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias Getaways.Repo
alias Getaways.Vacation.{Place, Booking, Review}
alias Getaways.Accounts.User

#
# USERS
#

mike =
  %User{}
  |> User.changeset(%{
    username: "mike",
    email: "mike@example.com",
    password: "secret"
  })
  |> Repo.insert!()

nicole =
  %User{}
  |> User.changeset(%{
    username: "nicole",
    email: "nicole@example.com",
    password: "secret"
  })
  |> Repo.insert!()

beachbum =
  %User{}
  |> User.changeset(%{
    username: "beachbum",
    email: "beachbum@example.com",
    password: "secret"
  })
  |> Repo.insert!()

#
# PLACES
#

base_url = "https://res.cloudinary.com/dyllzacwl/image/upload"

%Place{
  name: "Sand Castle",
  slug: "sand-castle",
  description: "Build endless sand castles in your front yard",
  location: "Portugal",
  max_guests: 2,
  pet_friendly: false,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(195.00),
  image: "#{base_url}/v1644783154/images/sand-castle_vox0uz.jpg",
  image_thumbnail: "#{base_url}/v1644783156/images/sand-castle-thumb_imoqrh.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-10-18],
      end_date: ~D[2019-10-21],
      total_price: Decimal.from_float(585.00),
      user: mike
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Blue Igloo",
  slug: "blue-igloo",
  description: "Chill out!",
  location: "Canada",
  max_guests: 3,
  pet_friendly: false,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(100.00),
  image: "#{base_url}/v1644783133/images/blue-igloo_oe78nn.jpg",
  image_thumbnail: "#{base_url}/v1644783128/images/blue-igloo-thumb_zztnyn.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-07-21],
      end_date: ~D[2019-07-31],
      total_price: Decimal.from_float(1000.00),
      user: mike
    }
  ],
  reviews: [
    %Review{
      comment: "It's a chillaxing experience! ❄️",
      rating: 5,
      user: nicole,
      inserted_at: DateTime.from_naive!(~N[2019-03-26 22:00:00], "Etc/UTC")
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Dock House",
  slug: "dock-house",
  description: "Escape to simplicity...",
  location: "Secret Lake",
  max_guests: 2,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(100.00),
  image: "#{base_url}/v1644783144/images/dock-house_ck86p3.jpg",
  image_thumbnail: "#{base_url}/v1644783135/images/dock-house-thumb_exvbei.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-06-10],
      end_date: ~D[2019-06-17],
      total_price: Decimal.from_float(700.00),
      user: nicole
    },
    %Booking{
      start_date: ~D[2019-08-07],
      end_date: ~D[2019-08-12],
      total_price: Decimal.from_float(3500.00),
      user: mike
    }
  ],
  reviews: [
    %Review{
      comment: "A little splash of heaven! 💦",
      rating: 5,
      user: mike,
      inserted_at: DateTime.from_naive!(~N[2019-03-15 22:00:00], "Etc/UTC")
    },
    %Review{
      comment: "Enjoyed some absinthe on the dock. 🍹",
      rating: 4,
      user: beachbum,
      inserted_at: DateTime.from_naive!(~N[2019-03-21 09:00:00], "Etc/UTC")
    },
    %Review{
      comment: "Great fishing! 🐟",
      rating: 5,
      user: nicole
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Ski Cabin",
  slug: "ski-cabin",
  description: "Ski in and ski out!",
  location: "Switzerland",
  max_guests: 6,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(225.00),
  image: "#{base_url}/v1644783157/images/ski-cabin_b4i4rw.jpg",
  image_thumbnail: "#{base_url}/v1644783157/images/ski-cabin-thumb_g9mb7u.jpg"
}
|> Repo.insert!()

%Place{
  name: "Hobbit House",
  slug: "hobbit-house",
  description: "Short cuts make delays, but inns make longer ones.",
  location: "New Zealand",
  max_guests: 4,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(150.00),
  image: "#{base_url}/v1644783140/images/hobbit-house_jvqebp.jpg",
  image_thumbnail: "#{base_url}/v1644783163/images/hobbit-house-thumb_qmsqhz.jpg"
}
|> Repo.insert!()

%Place{
  name: "Greek Villa",
  slug: "greek-villa",
  description: "Incredible ocean views",
  location: "Greece",
  max_guests: 6,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(225.00),
  image: "#{base_url}/v1644783136/images/greek-villa_jwirny.jpg",
  image_thumbnail: "#{base_url}/v1644783137/images/greek-villa-thumb_mgsno3.jpg"
}
|> Repo.insert!()

%Place{
  name: "Captain's Quarters",
  slug: "captains-quarters",
  description: "Slumber at sea",
  location: "Great Lakes, USA",
  max_guests: 2,
  pet_friendly: false,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(150.00),
  image: "#{base_url}/v1644783128/images/captains-quarters_jycepd.jpg",
  image_thumbnail: "#{base_url}/v1644783134/images/captains-quarters-thumb_nz8ojh.jpg"
}
|> Repo.insert!()

%Place{
  name: "Tranquil Tower",
  slug: "tranquil-tower",
  description: "Lift your spirit on stilts",
  location: "North Sea, Netherlands",
  max_guests: 4,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(125.00),
  image: "#{base_url}/v1644783160/images/tranquil-tower_siex9o.jpg",
  image_thumbnail: "#{base_url}/v1644783160/images/tranquil-tower-thumb_exemy9.jpg"
}
|> Repo.insert!()

%Place{
  name: "Courtyard Oasis",
  slug: "courtyard-oasis",
  description: "Float in your own lazy river",
  location: "Morocco",
  max_guests: 6,
  pet_friendly: true,
  pool: true,
  wifi: true,
  price_per_night: Decimal.from_float(200.00),
  image: "#{base_url}/v1644783134/images/courtyard-oasis_oqi7if.jpg",
  image_thumbnail: "#{base_url}/v1644783135/images/courtyard-oasis-thumb_wacxa2.jpg"
}
|> Repo.insert!()

%Place{
  name: "Beachfront Hut",
  slug: "beachfront-hut",
  description: "Swim, snorkel, and sunburn!",
  location: "Maldives",
  max_guests: 4,
  pet_friendly: false,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(145.00),
  image: "#{base_url}/v1644783134/images/beachfront-hut_mj2eq0.jpg",
  image_thumbnail: "#{base_url}/v1644783128/images/beachfront-hut-thumb_tzia2v.jpg"
}
|> Repo.insert!()

%Place{
  name: "Mountain Lake Cabin",
  slug: "mountain-lake-cabin",
  description: "Emerald waters await",
  location: "Italy",
  max_guests: 8,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(275.00),
  image: "#{base_url}/v1644783160/images/mountain-lake-cabin_luvjjl.jpg",
  image_thumbnail: "#{base_url}/v1644783066/mountain-lake-cabin-thumb_lzderw.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-06-01],
      end_date: ~D[2019-06-30],
      total_price: Decimal.from_float(8250.00),
      user: mike
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Lighthouse Retreat",
  slug: "lighthouse-retreat",
  description: "A brilliant location!",
  location: "Lake Michigan",
  max_guests: 10,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(275.00),
  image: "#{base_url}/v1644783147/images/lighthouse-retreat_rtyfgf.jpg",
  image_thumbnail: "#{base_url}/v1644783146/images/lighthouse-retreat-thumb_qypvcb.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-09-01],
      end_date: ~D[2019-09-30],
      total_price: Decimal.from_float(8250.00),
      user: mike
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Medieval Treehouse",
  slug: "medieval-treehouse",
  description: "Enchantment beckons",
  location: "Sherwood Forest",
  max_guests: 2,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(175.00),
  image: "#{base_url}/v1644783147/images/medieval-treehouse-thumb_e7wfpo.jpg",
  image_thumbnail: "#{base_url}/v1644783146/images/medieval-treehouse_dkgiai.jpg"
}
|> Repo.insert!()

%Place{
  name: "Infinity Pool",
  slug: "infinity-pool",
  description: "The views go on and on...",
  location: "Mexico",
  max_guests: 7,
  pet_friendly: true,
  pool: true,
  wifi: true,
  price_per_night: Decimal.from_float(275.00),
  image: "#{base_url}/v1644783142/images/infinity-pool_lrwwdm.jpg",
  image_thumbnail: "#{base_url}/v1644783142/images/infinity-pool-thumb_r5tpod.jpg"
}
|> Repo.insert!()

%Place{
  name: "Mountain Chalet",
  slug: "mountain-chalet",
  description: "Stay warm and cozy by the fire",
  location: "Emerald Lake, Canada",
  max_guests: 6,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(195.00),
  image: "#{base_url}/v1644783149/images/mountain-chalet_eh7eg5.jpg",
  image_thumbnail: "#{base_url}/v1644783149/images/mountain-chalet-thumb_mpdsop.jpg"
}
|> Repo.insert!()

%Place{
  name: "Oceanside",
  slug: "oceanside",
  description: "Go exploring on the beach",
  location: "Florida",
  max_guests: 8,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(175.00),
  image: "#{base_url}/v1644783152/images/oceanside_fgufnm.jpg",
  image_thumbnail: "#{base_url}/v1644783153/images/oceanside-thumb_k4ayk9.jpg"
}
|> Repo.insert!()

%Place{
  name: "Spanish Villa",
  slug: "spanish-villa",
  description: "Party all night",
  location: "Spain",
  max_guests: 10,
  pet_friendly: true,
  pool: true,
  wifi: true,
  price_per_night: Decimal.from_float(225.00),
  image: "#{base_url}/v1644783158/images/spanish-villa_yjebnz.jpg",
  image_thumbnail: "#{base_url}/v1644783158/images/spanish-villa-thumb_fqzzv1.jpg"
}
|> Repo.insert!()

%Place{
  name: "Hammock House",
  slug: "hammock-house",
  description: "Rest easy in the backcountry",
  location: "National Park",
  max_guests: 2,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(110.00),
  image: "#{base_url}/v1644783142/images/hammock-house_dieooo.jpg",
  image_thumbnail: "#{base_url}/v1644783141/images/hammock-house-thumb_i3royt.jpg"
}
|> Repo.insert!()

%Place{
  name: "Starry Yurt",
  slug: "starry-yurt",
  description: "A studio under the stars",
  location: "Colorado",
  max_guests: 2,
  pet_friendly: true,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(110.00),
  image: "#{base_url}/v1644783159/images/starry-yurt_mcd6ui.jpg",
  image_thumbnail: "#{base_url}/v1644783159/images/starry-yurt-thumb_z85ab8.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-06-10],
      end_date: ~D[2019-06-18],
      total_price: Decimal.from_float(880.00),
      user: nicole
    },
    %Booking{
      start_date: ~D[2019-12-10],
      end_date: ~D[2019-12-17],
      total_price: Decimal.from_float(770.00),
      user: nicole,
      state: "canceled"
    },
    %Booking{
      start_date: ~D[2019-08-07],
      end_date: ~D[2019-08-12],
      total_price: Decimal.from_float(1430.00),
      user: beachbum,
      state: "reserved"
    },
    %Booking{
      start_date: ~D[2019-09-01],
      end_date: ~D[2019-09-07],
      total_price: Decimal.from_float(660.00),
      user: beachbum,
      state: "canceled"
    },
    %Booking{
      start_date: ~D[2019-10-07],
      end_date: ~D[2019-10-12],
      total_price: Decimal.from_float(550.00),
      user: beachbum,
      state: "canceled"
    },
    %Booking{
      start_date: ~D[2019-11-10],
      end_date: ~D[2019-11-20],
      total_price: Decimal.from_float(1100.00),
      user: nicole,
      state: "reserved"
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Waterfront Study",
  slug: "waterfront-study",
  description: "Deep work happens here",
  location: "Flathead Lake",
  max_guests: 2,
  pet_friendly: false,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(150.00),
  image: "#{base_url}/v1644783163/images/waterfront-study_gl8nyr.jpg",
  image_thumbnail: "#{base_url}/v1644783161/images/waterfront-study-thumb_hdplba.jpg"
}
|> Repo.insert!()

%Place{
  name: "Lakeside Retreat",
  slug: "lakeside-retreat",
  description: "Relax under the big sky",
  location: "Austria",
  max_guests: 4,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(210.00),
  image: "#{base_url}/v1644783144/images/lakeside-retreat_fqtqri.jpg",
  image_thumbnail: "#{base_url}/v1644783144/images/lakeside-retreat-thumb_oh6bpn.jpg"
}
|> Repo.insert!()

%Place{
  name: "Fairytale Castle",
  slug: "fairytale-castle",
  description: "Live like a king and queen!",
  location: "Germany",
  max_guests: 6,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(295.00),
  image: "#{base_url}/v1644783136/images/fairytale-castle_alzaoq.jpg",
  image_thumbnail: "#{base_url}/v1644783135/images/fairytale-castle-thumb_grodl9.jpg"
}
|> Repo.insert!()

%Place{
  name: "Italian Chalet",
  slug: "italian-chalet",
  description: "Do some self-reflection",
  location: "Italy",
  max_guests: 10,
  pet_friendly: true,
  pool: true,
  wifi: true,
  price_per_night: Decimal.from_float(285.00),
  image: "#{base_url}/v1644783144/images/italian-chalet_eo1irm.jpg",
  image_thumbnail: "#{base_url}/v1644783143/images/italian-chalet-thumb_rk1ahu.jpg"
}
|> Repo.insert!()

%Place{
  name: "Seaside Lodge",
  slug: "seaside-lodge",
  description: "Enjoy the view from the nook",
  location: "California",
  max_guests: 4,
  pet_friendly: true,
  pool: false,
  wifi: true,
  price_per_night: Decimal.from_float(165.00),
  image: "#{base_url}/v1644783156/images/seaside-lodge_wyr0l1.jpg",
  image_thumbnail: "#{base_url}/v1644783156/images/seaside-lodge-thumb_b5cl4a.jpg"
}
|> Repo.insert!()
