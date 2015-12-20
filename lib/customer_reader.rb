require 'json'
require './lib/geo_calculator'
require './lib/office'

class CustomerReader

  attr_reader :office, :file_path

  def initialize(file_path)
    @office = Office.new
    @file_path = file_path
  end

  def customers_within_100km_by_user_id
    customers = []
    File.open(@file_path).each do |line|
      customer = JSON.parse(line)
      geo_calculator = GeoCalculator.new(@office.latitude, @office.longitude, customer['latitude'], customer['longitude'])
      customers << customer if geo_calculator.within_100km?
    end
    # The line below will sort and return customers by user id
    # If customers was an array of ActiveRecord instances, I would probably do it with a scope
    customers.sort { |a,b| a["user_id"] <=> b["user_id"] }
  end

end