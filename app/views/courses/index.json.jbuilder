json.array!(@courses) do |course|
  json.extract! course, :titulo, :slugg, :descripcion, :dificultad, :imgExt
  json.url course_url(course, format: :json)
end
