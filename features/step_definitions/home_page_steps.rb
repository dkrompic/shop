Given(/^there's is a product titled "(.*?)"$/) do |title|
  @product = FactoryGirl.create(:product, title: title)
end

When(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see the "(.*?)" product$/) do |title|
  @product = Product.find_by_title(title)
  expect(page).to have_content(@product.title)
end