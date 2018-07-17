class WeatherDataGrabber
    
    def initialize
       @pointData = getAPIDataPoint
       @forecastHourlyData = getAPIDataHourlyForecast
       @forecastData = getAPIDataForecast
    end
    
    def getAPIDataPoint 
        response = HTTParty.get('https://api.weather.gov/points/40.8744,-73.9047')    
        response = response.to_s
        response = JSON.parse(response)
        return response
    end
    
    def getAPIDataHourlyForecast
        response = HTTParty.get('https://api.weather.gov/gridpoints/OKX/35,42/forecast/hourly')    
        response = response.to_s
        response = JSON.parse(response)
        return response
    end
    
    def getAPIDataForecast
        response = HTTParty.get('https://api.weather.gov/gridpoints/OKX/35,42/forecast')
        response = response.to_s
        response = JSON.parse(response)
        return response
    end
    
    def getCurrentConditions
        return @forecastHourlyData["properties"]["periods"][0]["shortForecast"]
    end
    
    def getCurrentConditionsPic
        
        picURL = @forecastHourlyData["properties"]["periods"][0]["icon"]
        return picURL.gsub!("small","large")
    end
    
    def getCurrentTemp
        return @forecastHourlyData["properties"]["periods"][0]["temperature"]
    end
    
    def getForecastArray
       return @forecastData["properties"]["periods"] 
    end
    
end