json.id app.id
json.created_at app.created_at
json.name app.name
json.build_count app.builds.count
json.icon do
  json.thumb thumb_app_icon_path(app)
  json.default app_icon_path(app)
end
