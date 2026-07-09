//
//  WeatherDTOs.swift
//  WeatherSphere
//
//  Created by gokul v on 09/07/26.
//

import Foundation

struct ApiWeatherResponse: Decodable {
    let location: ApiLocation
    let current: ApiCurrent
    let forecast: ApiForecast
}

struct ApiLocation: Decodable {
    let name: String
}

struct ApiCurrent: Decodable {
    let tempF: Double
    let condition: ApiCondition
    let windMph: Double
    let humidity: Int
    let uv: Double
    let precipMm: Double

    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case condition
        case windMph = "wind_mph"
        case humidity
        case uv
        case precipMm = "precip_mm"
    }
}

struct ApiCondition: Decodable {
    let text: String
    let code: Int
}

struct ApiForecast: Decodable {
    let forecastday: [ApiForecastDay]
}

struct ApiForecastDay: Decodable {
    let day: ApiDay
    let hour: [ApiHour]
}

struct ApiDay: Decodable {
    let maxtempF: Double
    let mintempF: Double

    enum CodingKeys: String, CodingKey {
        case maxtempF = "maxtemp_f"
        case mintempF = "mintemp_f"
    }
}

struct ApiHour: Decodable {
    let timeEpoch: Int
    let time: String
    let tempF: Double
    let condition: ApiCondition

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempF = "temp_f"
        case condition
    }
}

//MARK: - Extract the datas

extension ApiWeatherResponse {

    func extractCurrentWeather() -> CurrentWeather {
        let currentDay = forecast.forecastday.first

        return CurrentWeather(location: location.name,
                              temperature: Int(current.tempF),
                              condition: current.condition.text,
                              high: Int(currentDay?.day.maxtempF ?? current.tempF),
                              low: Int(currentDay?.day.mintempF ?? current.tempF))
    }

    func extractHourlyForecast() -> [HourlyForecast] {
        let currentEpoch = Int(Date().timeIntervalSince1970)
        let allHours = forecast.forecastday.flatMap { $0.hour }
        let futureHours = allHours.filter { $0.timeEpoch >= currentEpoch }.prefix(24)

        return futureHours.enumerated().map { key, value in
            let date = Date(timeIntervalSince1970: TimeInterval(value.timeEpoch))
            let formatter = DateFormatter()
            formatter.dateFormat = "h a"

            return HourlyForecast(
                time: key == 0 ? "Now" : formatter.string(from: date),
                iconName: mapConditionToSFSymbol(code: value.condition.code),
                temperature: Int(value.tempF),
                isCurrent: key == 0
            )
        }
    }

    private func mapConditionToSFSymbol(code: Int) -> String {
        switch code {
        case 1000:
            return "sun.max"

        case 1003:
            return "cloud.sun"

        case 1006, 1009:
            return "cloud"

        case 1030, 1135:
            return "cloud.fog"

        case 1063...1201:
            return "cloud.rain"

        case 1210...1225:
            return "snow"

        case 1273...1282:
            return "cloud.bolt.rain"

        default: return "cloud"

        }
    }

    func extractWeatherDetails() -> WeatherDetails {
        let uvDesc: String
        switch current.uv {
        case 0...2: uvDesc = "Low"
        case 3...5: uvDesc = "Moderate"
        case 6...7: uvDesc = "High"
        case 8...10: uvDesc = "Very High"
        default: uvDesc = "Extreme"
        }

        return WeatherDetails(
            windSpeed: Int(current.windMph),
            humidity: current.humidity,
            uvIndex: Int(current.uv),
            uvDescription: uvDesc,
            precipitation: Int(current.precipMm)
        )
    }
}
