require 'spec_helper'

describe Office do

  before do
    @office = Office.new
  end

  describe '#latitude' do

    it "should match intercom's Dublin Office latitude" do
      @office.latitude.should == 53.3381985
    end

  end

  describe '#longitude' do

    it "should match intercom's Dublin Office longitude" do
      @office.longitude.should == -6.2592576
    end

  end
end
