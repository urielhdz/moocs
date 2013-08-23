json.array!(@topics) do |topic|
  json.extract! topic, :titulo, :corte, :course_id, :descripcion
  json.url topic_url(topic, format: :json)
end
