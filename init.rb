require './lib/customer_reader'

customer_reader = CustomerReader.new('./customers.json')
puts "*** Full list of customers within 100km ***"
customer_reader.customers_within_100km_by_user_id.each do |customer|
  puts "#{customer['user_id']} #{customer['name']}"
end
puts "*** End of the list ***"