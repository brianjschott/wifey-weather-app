require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
    @dataGrabber = WeatherDataGrabber.new
    @currentConditions = @dataGrabber.getCurrentConditions
    @currentTemp = @dataGrabber.getCurrentTemp
    @currentConditionsPic = @dataGrabber.getCurrentConditionsPic
    @forecastArray = @dataGrabber.getForecastArray
    return erb :index
  end
end
