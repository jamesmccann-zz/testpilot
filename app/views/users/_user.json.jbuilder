json.cache! user do
  json.extract!(user, :id, :full_name, :email, :created_at)
end