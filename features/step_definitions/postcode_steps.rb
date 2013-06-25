
When(/^I enter postal code (.+)$/) do |postcode|
  begin
    @it = Regional::Postcode.new(postcode)
  rescue => @error
  end
end

