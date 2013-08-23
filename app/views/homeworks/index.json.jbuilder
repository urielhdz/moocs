json.array!(@homeworks) do |homework|
  json.extract! homework, :titulo, :descripcion, :entrega, :curso_id
  json.url homework_url(homework, format: :json)
end
