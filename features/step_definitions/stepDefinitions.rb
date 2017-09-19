
Given(/^I am on the google shopping page$/) do
  visit('https://www.google.co.uk/shopping')
end

And(/^I search for "([^"]*)"$/) do |arg|
  fill_in 'q', with: arg
  page.find('#gbqfb').click
  sleep(1)
end

Then(/^I get "([^"]*)" results$/) do |arg|
  @page = GoogleShopping.new
  @page.verify_search(arg)
end

When(/^I click on up to £15$/) do
  find('span', :text => 'Up to £15').click
  sleep(2)
end

Then(/^None of the results are more that £15$/) do
  elements = all('span.price')
  prices = elements.map { |e| e.text.sub('£', '').to_i }
  prices.each do |price|
    if price > 15
      fail
    end
  end
end

When(/^I click on books$/) do
  @page.click_on_books_category
end

Then(/^the results are all books$/) do
  search = find('div._Gwj.std')
  if search.text != 'Books'
    fail
  end
end

When(/^I click on Ocado$/) do
  find(:xpath, '//*[@id="leftnavc"]/div/div[5]/div[2]/div[4]/a').click
  sleep(2)
end

Then(/^the results are for Ocado$/) do |arg|
  @page.verify_shopping(arg)
end

When(/^I click more$/) do
  find('div.sr__link').click
  sleep(2)
end

And(/^I click on Eat big$/) do
  find(:xpath, '//div[@id="leftnavc"]/div/div[5]/div[3]/div[4]/a/span[2]').click
  sleep(2)
end

Then(/^the results are for Eat big$/) do |arg|
  @page.verify_shopping(arg)
end

When(/^I enter £20$/) do
  within('sr__price-box') do
    fill_in 'lower', with: '20'
  end
end

And(/^I enter £30$/) do
  within('sr__price-box')  do
    fill_in 'upper', with: '30'
  end
end

And(/^I click go$/) do
  find(:xpath, '(//button[@type="submit"])[2]').click
  sleep(2)
end

Then(/^the results are all between £20 and £30$/) do 
  search = find('div._Gwj.std')
  if search.text != '20 and £30'
    fail
  end
end