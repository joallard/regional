Then(/^it is valid$/) do
  @it.should be_valid
end

Then(/^it is \S* ?invalid$/) do
  @it.should_not be_valid
end

Then(/^(?:it does ?n.t work|it ?[i']s an error)$/) do
  @error.should_not be_nil
end

Then('the canonical representation is "$s"') do |s|
  @it.to_s.should == s
end

Then(/^pry$/i) do
  binding.pry
end
