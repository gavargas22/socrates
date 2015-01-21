json.array!(@sections) do |section|
  json.extract! section, :id, :name, :department, :number
  json.url section_url(section, format: :json)
end
