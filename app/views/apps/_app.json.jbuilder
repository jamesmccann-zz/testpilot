json.id app.id
json.name app.name
json.current_build do
  json.partial!('builds/build', build: app.latest_build) 
end if app.latest_build.present?
