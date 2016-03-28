jwo = User.where(email: "jwo@example.com").first_or_create
jwo.password = "12345678"
jwo.save

if jwo.posts.empty?
  jwo.posts.create text: "Blaggy Plaggy"
  jwo.posts.create text: "Yolo!"
end
