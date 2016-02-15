json.array!(@courses) do |course|
  json.extract! course, :id, :number, :title, :description, :startdate, :enddate, :status
  json.url course_url(course, format: :json)
end
