json.array!(@courses) do |course|
  json.extract! course, :id, :crn, :description, :password_hash, :section_id, :faculty_id
  json.url course_url(course, format: :json)
end
