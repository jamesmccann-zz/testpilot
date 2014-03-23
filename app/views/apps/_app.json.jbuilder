json.id app.id
json.created_at app.created_at
json.name app.name
json.build_count app.builds.count
json.icon do
  json.thumb app.icon.thumb.url
  json.default  app.icon.url
end
