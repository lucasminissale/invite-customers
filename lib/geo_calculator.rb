class GeoCalculator

  attr_reader :latitude_a, :latitude_b, :latitude_difference, :longitude_difference, :earths_radius_in_km

  # GeoCalculator will calculate the distance between two points: A and B
  # being A, for the purpose of this exercise, the Dublin office of Intercom
  def initialize(latitude_a, longitude_a, latitude_b, longitude_b)
    @latitude_a = to_radians(latitude_a.to_f)
    @latitude_b = to_radians(latitude_b.to_f)
    @latitude_difference = to_radians(latitude_b.to_f - latitude_a.to_f)
    @longitude_difference = to_radians(longitude_b.to_f - longitude_a.to_f)
    @earths_radius_in_km = 6371
  end

  def within_100km?
    true if distance_in_km <= 100
  end

  private

  def distance_in_km
    chord_length = calculate_chord_length
    central_angle = calculate_central_angle(chord_length)
    calculate_distance(central_angle)
  end

  def calculate_chord_length
    Math.sin(@latitude_difference/2) * Math.sin(@latitude_difference/2) +
    Math.cos(@latitude_a) * Math.cos(@latitude_b) *
    Math.sin(@longitude_difference/2) * Math.sin(@longitude_difference/2)
  end

  def calculate_central_angle(chord_length)
    2 * Math.atan2(Math.sqrt(chord_length), Math.sqrt(1 - chord_length))
  end

  def calculate_distance(central_angle)
    @earths_radius_in_km * central_angle
  end

  def to_radians(degrees)
    degrees * Math::PI / 180
  end

end