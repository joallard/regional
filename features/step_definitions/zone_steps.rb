Given(/^the zone is "?([^"]*)"?$/) do |zone|
  @zone = Regional::Zone.new(zone)
end

Then(/^(.+) should be included$/) do |place|
  place = Regional::Postcode.new(place)
  @zone.should cover(place)
end

Then(/^(.+) should.?n.t be included$/) do |place|
  place = Regional::Postcode.new(place)
  @zone.should_not cover(place)
end

