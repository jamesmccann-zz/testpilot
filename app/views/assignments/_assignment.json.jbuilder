json.cache! assignment do
  json.id assignment.id
  json.developer assignment.developer
  json.user { json.partial! assignment.user }
end
