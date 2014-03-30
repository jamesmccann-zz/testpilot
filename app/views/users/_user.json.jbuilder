json.cache! user do
  json.extract!(user, :id, :email, :created_at)
end