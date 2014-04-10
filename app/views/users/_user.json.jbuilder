json.cache! user do
  json.extract!(user, :id, :email, :full_name, :created_at)
end