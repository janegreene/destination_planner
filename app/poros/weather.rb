class Weather
  attr_reader :current_temp, :high_temp, :low_temp, :summary, :date
  def initialize(data)
    @date = Time.at(data[:dt]).strftime('%A, %m/%d')
    @current_temp =data[:main][:temp]
    @high_temp = data[:main][:temp_max]
    @low_temp = data[:main][:temp_min]
    @summary = data[:weather][0][:description]
  end
  def self.get_weather(json)
    Weather.new(json)
  end
end
