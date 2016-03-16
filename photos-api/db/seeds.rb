100.times do 

  name = Faker::Name.name
  url = Faker::Avatar.image(name)
  thumb = Faker::Avatar.image(name, "50x50")

  Photo.create title: name, url: url, thumbnailUrl: thumb
end
