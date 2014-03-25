json.cache! assignment do
  json.user do
    json.partial! assignment.user
  end

  json.role     assignment.role
end
