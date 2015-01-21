json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :user_id
  json.url faculty_url(faculty, format: :json)
end
