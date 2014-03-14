json.array! @app.builds do |build|
  json.partial!('builds/build', build: build)
end
