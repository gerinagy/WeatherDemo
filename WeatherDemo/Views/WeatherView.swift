//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by Gergo Nagy on 1/2/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            //                            Image(systemName: "sun.max")
                            //                                .font(.system(size: 40))
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")) { image in
                                image
                                    .frame(width: 80, height: 30)
                                    .aspectRatio(contentMode: .fit)
                                Text(weather.weather[0].main)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.temp.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo:"thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "º"))
                        Spacer()
                        WeatherRow(logo:"thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "º"))
                    }
                    HStack {
                        WeatherRow(logo:"wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo:"humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.606, saturation: 1.0, brightness: 0.424))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.606, saturation: 1.0, brightness: 0.424))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
