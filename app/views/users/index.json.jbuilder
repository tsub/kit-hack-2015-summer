json.array!(@users) do |user|
  json.extract! user, :id, :name, :address, :gender, :birthdate, :hobby, :avatar, :face_type
  json.url user_url(user, format: :json)
end
