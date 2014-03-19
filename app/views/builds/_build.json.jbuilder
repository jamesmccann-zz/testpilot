json.cache! @build do
  json.extract! @build, :app_id, :created_at, :release_notes
  json.url [:api, @build.app, @build]
end