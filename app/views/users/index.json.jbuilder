json.array!(@users) do |user|
  json.extract! user, :id, :name, :admin, :email
  json.url user_url(user, format: :json)
end
