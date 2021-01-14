require 'json'
module PricesHelper
  def display_sample_prices_for_lab_tests price
    price_rows = ''
    total = 0.0
    unless price.nil? and price.lab_tests.size.zero?
      my_lab_tests = JSON.parse price.lab_tests
      my_lab_tests.each do |curr_lab_test|
        unit_price = curr_lab_test['unitPrice'].to_f
        quantity_for_test = curr_lab_test['quantity'].to_f
        subtotal = unit_price * quantity_for_test
        price_rows << "
          <tr>
            <td>#{curr_lab_test['title']}</td>
            <td>#{curr_lab_test['quantity']}</td>
            <td>#{curr_lab_test['unitPrice']}</td>
            <td>#{
              total += subtotal
              subtotal
              }</td>
          </tr>
        ".html_safe
      end
    end
    "
      <table class='table is-bordered is-striped is-narrow is-hoverable is-fullwidth'>
        <tr>
          <th>Test</th>
          <th>Price per unit</th>
          <th>Quantity</th>
          <th>Subtotal</th>
        </tr>
        <tbody>#{price_rows}</tbody>
      </table>
      <table class='table is-bordered is-striped is-narrow is-hoverable is-fullwidth'>
        <tr>
          <th>Total</th>
        </tr>
        <tbody>
          <tr>
            <td>#{total}</td>
          </tr>
        </tbody>
      </table>
    ".html_safe
  end
end
