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

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  pos_e1 = page.body.index(e1)  
  pos_e2 = page.body.index(e2)
  if pos_e1.should_not > pos_e2
    fail "Wrong order"
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  if rating_list == "all"
    log "all"
    @uncheckedratings = []
    @checkratings = ["R", "PG-13", "PG", "G"]
  else

    @checkratings = rating_list.split(', ') 
    @uncheck = uncheck
    if @checkratings == nil || @checkratings.length <= 0
      fail "Problematic Scenario: Nothing checked or unchecked!"
    end

  end
end

And /I uncheck other checkboxes: (.*)/ do |unchecked|
  @uncheckedratings = unchecked.split(', ')
end


And /I submit the ratings form/  do
  log "Submitted"
  if @uncheck == nil
      @uncheckedratings.each do |c|
        uncheck("ratings[#{c}]")
      end
      @checkratings.each do |c|
        check("ratings[#{c}]")
      end
    else
      @checkratings.each do |c|
        uncheck("ratings[#{c}]")
      end
    end
  click_button(:ratings_submit)
end

Then /I should not see PG, R rated movies/ do |expected_table|
  if page.respond_to? :should
    # puts expected_table.diff!(table_at(table_id).to_a)
    if all("table#movies tr").count.should_not == expected_table.hashes.count + 1
      fail "The resulted table does not match expected table"
    else
      log "True"
    end
  end
end

Then /I should see only PG, R rated movies/ do |expected_table|
  if page.respond_to? :should
    if all("table#movies tr").count.should_not == expected_table.hashes.count + 1
      fail "The resulted table does not match expected table"
    else
      log "True"
    end
  end
end

Then /I should see all the movies/ do |expected_table|
  if page.respond_to? :should
    if all("table#movies tr").count.should_not == expected_table.hashes.count + 1
      fail "The resulted table does not match expected table"
    else
      log "True"
    end
  end
end