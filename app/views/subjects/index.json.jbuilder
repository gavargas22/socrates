json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :short_name, :section_id
  json.url subject_url(subject, format: :json)
end
