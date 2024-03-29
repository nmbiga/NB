Given /^I am on the (.+) Home Page$/ do |site|
  site site
  visit :home
end

When /^I search for a? ?"([^"]*)"$/ do |term|
  on :home do |page|
    page.search_for term
  end
end

When /^I search for a?n? ?([^"].+[^"])$/ do |term|
  term = Common.get_search_term_data term
  on :home do |page|
    page.search_for term
  end
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  on :results do |page|
    page.number_search_results.should >= exp_num_results.gsub(",","").to_i
  end
end

Then /^I should see at most ([\d,]+) results$/ do |exp_num_results|
  on :results do |page|
    page.number_search_results.should <= exp_num_results.gsub(",","").to_i
  end
end

When /^I convert (.+)$/ do |conversion_statement|
  on :home do |page|
    page.search_for "convert #{conversion_statement}"
  end
end

Then /^I should see the conversion result "([^"]*)"$/ do |exp_conversion_result|
  on :results do |page|
    page.conversion_result.gsub('metres', 'meters').should == exp_conversion_result
  end
end
