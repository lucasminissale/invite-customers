require 'spec_helper'

describe CustomerReader do

  describe '#valid_input' do

    context 'when passing a valid list of customers' do
      it "should return a valid list of matching customers" do
        customer_reader = CustomerReader.new('./customers.json')
        customer_reader.customers_within_100km_by_user_id.size.should == 16
      end
    end

    context 'when passing a valid list of customers with 2 matching customers and 1 other customer' do
      it "should return 2 matching customers" do
        customer_reader = CustomerReader.new('spec/customers.json')
        customer_reader.customers_within_100km_by_user_id.size.should == 2
      end
    end

  end

  describe '#invalid_input' do

    context 'when passing an invalid list of customers' do
      it "should rise an error because the file doesn't exist" do
        customer_reader = CustomerReader.new('./customers.yml')
        expect { customer_reader.customers_within_100km_by_user_id }.to raise_error(Errno::ENOENT)
      end
    end

  end

end
