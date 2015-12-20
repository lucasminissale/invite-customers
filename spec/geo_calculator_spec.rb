require 'spec_helper'

describe GeoCalculator do

  before do
    @office = Office.new
  end

  describe '#within_100km?' do
    context 'when distance is less than 100km' do
      it "should be true" do
        geo_calculator = GeoCalculator.new(@office.latitude, @office.longitude, 52.833502, -7.4)
        geo_calculator.within_100km?.should be_truthy
      end
    end

    context 'when distance is equal to 100km' do
      it "should be true" do
        geo_calculator = GeoCalculator.new(@office.latitude, @office.longitude, 52.833502, -7.4986)
        geo_calculator.within_100km?.should be_truthy
      end
    end

    context 'when distance is more than 100km' do
      it "should not be false" do
        geo_calculator = GeoCalculator.new(@office.latitude, @office.longitude, 52.833502, -7.5)
        geo_calculator.within_100km?.should_not be_truthy
      end
    end
  end

  describe '#different_inputs' do
    context 'when passing string values' do
      it "should be true" do
        geo_calculator = GeoCalculator.new(@office.latitude, @office.longitude, "52.833502", "-7.4")
        geo_calculator.within_100km?.should be_truthy
      end
    end

    context 'when passing nil values' do
      it "should not be true" do
        geo_calculator = GeoCalculator.new(@office.latitude, @office.longitude, nil, nil)
        geo_calculator.within_100km?.should_not be_truthy
      end
    end
  end
end
