json.cache! @build do
  json.extract! @build, :app_id, :created_at
  json.url [:api, @build.app, @build]
end