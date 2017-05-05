Rails.application.routes.draw do
  resources :racers do
  	post "entries" => "racers#create_entry"
  end

  resources :races

  get "/api/races/" => "races#index"

  get "/api/races/:id" => "races#show"

  get "/api/races/:race_id/results" => "races#show"

  get "/api/races/:race_id/results/:id" => "races#show"

  get "/api/racers" => "racers#index"

  get "/api/racers/:id" => "racers#show"

  get "/api/racers/:racer_id/entries" => "racers#show"

  get "/api/racers/:racer_id/entries/:id" => "racers#show"

end
