json.array!(@publications) do |publication|
  json.extract! publication, :body, :student_id
  json.url publication_url(publication, format: :json)
end
