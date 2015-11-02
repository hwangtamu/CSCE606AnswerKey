# Add a declarative step here for populating the DB with movies.
# Don't copy my code if you see my repo. Author: Yi Huang

def log(s)
  puts "[Debug]: #{s}"
end

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

Then /the director of "Alien" should be "(.*)"/ do |updated_director|
  pos = page.body.index(updated_director)
  if pos < 0
    fails "Fail updateing director"
  end
end

And /I am supposed to see "'Alien' has no director info"/ do
  regexp = Regexp.new("Alien R 1979-05-25")

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end