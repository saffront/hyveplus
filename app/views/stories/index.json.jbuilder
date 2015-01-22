json.array!(@stories) do |story|
  json.extract! story, :id, :title, :content, :author
  json.url story_url(story, format: :json)
end
