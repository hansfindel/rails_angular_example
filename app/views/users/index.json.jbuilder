json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_name, :points, :fullname, :image_path
  json.url user_url(user, format: :json)
end
