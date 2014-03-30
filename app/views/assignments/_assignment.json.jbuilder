json.cache! assignment do
  json.id assignment.id
  json.role assignment.role
  json.user { json.partial! assignment.user }
end
