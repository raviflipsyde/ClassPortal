json.array!(@teaches) do |teach|
  json.extract! teach, :id, :request, :instructor_id, :course_id
  json.url teach_url(teach, format: :json)
end
