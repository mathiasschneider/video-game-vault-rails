Rails.application.routes.draw do

  post "/users", controller: "users", action: "create"
  get "/users/:id", controller: "users", action: "show"
  patch "/users/:id", controller: "users", action: "update"
  delete "/users/:id", controller: "users", action: "destroy"

  get "/lists", controller: "lists", action: "index"
  post "/lists", controller: "lists", action: "create"
  get "/lists/:id", controller: "lists", action: "show"
  patch "/lists/:id", controller: "lists", action: "update"
  delete "/lists/:id", controller: "lists", action: "destroy"

  post "/list_games/", controller: "list_games", action: "create"
  patch "/list_games/:id", controller: "list_games", action: "update"
  delete "/list_games/:id", controller: "list_games", action: "destroy"

  post "/games", controller: "games", action: "index"
  get "/games/:id", controller: "games", action: "show"

  post "/sessions", controller: "sessions", action: "create"
end
