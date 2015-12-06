Given(/^we have the following wines:$/) do |wines|
  wines_attributes = wines.hashes.map { |tab_wine_attrs |
    wine_attributes = FactoryGirl.attributes_for(:wine).stringify_keys()
    wine_attributes.merge(tab_wine_attrs)
  }
  Wine.create!(wines_attributes)
end
When(/^I search for Wine "(.*?)"$/) do |search_query|
  visit('/wines')
  fill_in('search_query', with: search_query)
  click_button('Search')
end
Then(/^the results must be:$/) do |expected_results|
  results = [['short_description']] +
    page.all('tr.data').map {|tr|
    tr.find('short_description').text
  }
  puts results
end

When(/^I visit the Wines Listings page$/) do
  visit('/wines')
end
Then(/^the listings must be:$/) do |expected_results|
  results = [['short_description']] +
    page.all('tr.data').map {|tr|
    tr.find('short_description').text
  }
  puts results
end

When(/^I visit the Wines Listings page and click on the image for "An Australian Wine"$/) do
  visit('/wines')
  find(:xpath, "//a[@href='/wines/64?page=1']/..").click()
end
Then(/^the page must contain:$/) do
  results = page.all('tr.data').map{|tr|
    tr.find('short_description').text
  }
  puts results
end

