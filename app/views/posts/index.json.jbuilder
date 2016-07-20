json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :tag
  json.url post_url(post, format: :json)

  json.comments post.comments do |comment|
    json.content comment.content
    json.user_id comment.user_id
    json.created_at comment.created_at
  end
end
json.image post.image
