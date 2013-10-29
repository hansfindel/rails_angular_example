json.array!(@users) do |user|
  json.extract! user, :name, :last_name, :points, :fullname
  json.url user_url(user, format: :json)
end
