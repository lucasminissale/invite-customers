require_relative '../lib/office'
require_relative '../lib/customer_reader'
require_relative '../lib/geo_calculator'

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end