json.cache! build do
  json.extract! build, :id, :app_id, :number, :created_at, :release_notes
  json.url app_build_url(build.app, build)
end
