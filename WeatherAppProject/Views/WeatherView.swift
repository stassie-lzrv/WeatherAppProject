//
//  WeatherView.swift
//  WeatherAppProject
//
//  Created by Настя Лазарева on 01.12.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today \(Date().formatted(.dateTime.month().year().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 30){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        Spacer()
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Town_Cityscape.svg/1600px-Town_Cityscape.svg.png?20191116163628")){
                        image in image
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
            .frame(maxWidth : .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now").bold().padding(.bottom)
                    
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.temp_min.roundDouble() + "°" )
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.temp_max.roundDouble() + "°" )
                        
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s" )
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%" )
                        
                    }
                }
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.755, saturation: 0.979, brightness: 0.396))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.755, saturation: 0.979, brightness: 0.396))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
