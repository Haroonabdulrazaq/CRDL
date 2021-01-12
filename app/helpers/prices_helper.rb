require 'json'
module PricesHelper
  def display_sample_prices_for_lab_tests price
    unless price.nil? and price.lab_tests.size.zero?
      my_lab_tests = JSON.parse price.lab_tests
      my_lab_tests.each do |curr_lab_test|
        puts "This is the current elt #{curr_lab_test}"
      end
    end
  end
end
