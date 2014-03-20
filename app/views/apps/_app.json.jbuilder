json.id app.id
json.created_at app.created_at
json.name app.name
json.build_count app.builds.count
json.icons do
  json.thumb app.icon.thumb.url
  json.main  app.icon.url
end
