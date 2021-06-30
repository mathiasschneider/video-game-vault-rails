ListGame.create!([
{list_id: 1, igdb_game_id: 3810, quantity: 1},
{list_id: 1, igdb_game_id: 4201, quantity: 1},
{list_id: 2, igdb_game_id: 1802, quantity: 4},
{list_id: 2, igdb_game_id: 2777, quantity: 1},
{list_id: 3, igdb_game_id: 1627, quantity: 1},
{list_id: 3, igdb_game_id: 1804, quantity: 1},
{list_id: 4, igdb_game_id: 3935, quantity: 1},
{list_id: 4, igdb_game_id: 134014, quantity: 2},
{list_id: 5, igdb_game_id: 18866, quantity: 4},
{list_id: 5, igdb_game_id: 3668, quantity: 1},
{list_id: 6, igdb_game_id: 3669, quantity: 1},
{list_id: 6, igdb_game_id: 2628, quantity: 1}
])
List.create!([
{title: "Best Games", public: true, user_id: 1},
{title: "Wishlist", public: true, user_id: 3},
{title: "My Wishlist", public: false, user_id: 4},
{title: "list", public: false, user_id: 4},
{title: "Wishlist", public: true, user_id: 1},
{title: "Gamecube", public: false, user_id: 3}
])
User.create!([
{username: "mat", email: "mat@gmail.com", password_digest: "$2a$12$T30yJLcv/MihV5usR11f3uDitJDX0XIlEBw3RNoMiJEek7HM0/9oi"},
{username: "Mat", email: "me@gmail.com", password_digest: "$2a$12$9nT9cZ6xM9Slnx1XG9EAAOsjIQw/L2Gnao6374TnxwJjZrMw29TmG"},
{username: "Terry", email: "TBH@gmail.com", password_digest: "$2a$12$oJS1my.pQTnNFP.UAu46N.irgFdeeem6WOZRpvm5e0ZrCD1M.MltK"},
{username: "Game02Freak", email: "VG@gmail.com", password_digest: "$2a$12$ANcM310BoytbTu4P4StsSumDnw/UHrua.mvRBQ6Za5TENA96BgD5."},
{username: "insomnia", email: "insomnia@gmail.com", password_digest: "$2a$12$YSsmvtuWovg4lycLJftQ5O2tFhH708CnWw/6STd1dhNcudcPklbO."}
])