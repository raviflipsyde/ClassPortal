json.array!(@cmaterials) do |cmaterial|
  json.extract! cmaterial, :id, :content, :course_id
  json.url cmaterial_url(cmaterial, format: :json)
end
