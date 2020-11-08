class Forecast
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(data)
    @id = nil
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily])[0..4]
    @hourly_weather = hourly(data[:hourly][0..7])
  end

  def current(data)
    { datetime: Time.zone.at(data[:dt]),
      sunrise: Time.zone.at(data[:sunrise]),
      sunset: Time.zone.at(data[:sunset]),
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: (data[:visibility] * 0.000621371).round(1),
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon] }
  end

  def daily(data)
    data.map do |day|
      { date: Time.zone.at(day[:dt]).strftime('%Y-%m-%d'),
        sunrise: Time.zone.at(day[:sunrise]),
        sunset: Time.zone.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon] }
    end
  end

  def hourly(data)
    data.map do |hour|
      { time: Time.zone.at(hour[:dt]).strftime('%H:%M:%S'),
        wind_speed: "#{hour[:wind_speed]} mph",
        wind_direction: "from #{wind_direction(hour[:wind_deg])}",
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon] }
    end
  end

  def wind_direction(degree)
    return 'N' if degree.between?(348.75, 11.25)
    return 'NNE' if degree.between?(11.25, 33.75)
    return 'NE' if degree.between?(33.75, 56.25)
    return 'ENE' if degree.between?(56.25, 78.75)
    return 'E' if degree.between?(78.75, 101.25)
    return 'ESE' if degree.between?(101.25, 123.75)
    return 'SE' if degree.between?(123.75, 146.25)
    return 'SSE' if degree.between?(146.25, 168.75)
    return 'S' if degree.between?(168.75, 191.25)
    return 'SSW' if degree.between?(191.25, 213.75)
    return 'SW' if degree.between?(213.75, 236.25)
    return 'WSW' if degree.between?(236.25, 258.75)
    return 'W' if degree.between?(258.75, 281.25)
    return 'WNW' if degree.between?(281.25, 303.75)
    return 'NW' if degree.between?(303.75, 326.25)
    return 'NNW' if degree.between?(326.25, 348.75)
  end
end
