json.array! @guests do |guest|
  if (40..50).cover?(guest.age)
    json.partial! 'api/guests/guest', guest: guest
  end
end
