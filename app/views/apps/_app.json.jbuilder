json.id app.id
json.created_at app.created_at
json.name app.name
json.build_count app.builds.count
if latest_build = app.latest_build
  json.latest_build do
    json.id latest_build.id
    json.number latest_build.number
  end
end
json.icon do
  json.thumb thumb_app_icon_path(app)
  json.default app_icon_path(app)
end
