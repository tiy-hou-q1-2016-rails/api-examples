json.posts @posts do |post|
  json.id post.id
  json.text post.text
  json.user do
    json.id post.user.id
    json.email post.user.email
  end
end
