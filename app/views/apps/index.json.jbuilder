json.array! @apps do |app|
  json.cache! app do
    json.partial! app
  end
end