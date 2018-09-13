json.array! @parties.each do |party|
  json.name party.name
  json.guests party.guests
end
