json.array!(@cocktails) do |cocktail|
  json.extract! coktail, :id, :name
  json.url cocktail_url(cocktail, format: :json)
end