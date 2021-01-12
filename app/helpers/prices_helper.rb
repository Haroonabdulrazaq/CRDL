require 'json'
module PricesHelper
  def display_sample_prices_for_lab_tests price
    unless price.nil? and price.lab_tests.size.zero?
      puts "Is lab test an array ? #{price.lab_tests.class}"
      # my_lab_tests = remove_quotes(price.lab_tests)
      # puts "This is the passed lab test: #{my_lab_tests}"
      # my_lab_tests.each do |curr_lab_test|
      #   puts "This is the current elt #{curr_lab_test}"
      #   parsed_lab_test = JSON.parse(curr_lab_test);
      #   puts "The parsed lab test is : #{parsed_lab_test}"
      # end
    end
  end

  private
  def remove_quotes m_string
    # result = ''
    m_string.split()
    # result
  end
end
