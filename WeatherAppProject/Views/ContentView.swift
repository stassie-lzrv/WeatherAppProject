//
//  ContentView.swift
//  WeatherAppProject
//
//  Created by Настя Лазарева on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                } else{
                    LoadingView().task {
                        do{
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                        }catch{
                            print("Error getting weather \(error)")
                        }
                    }
                }
            } else{
                if locationManager.isLoading{
                    LoadingView()
                } else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.755, saturation: 0.979, brightness: 0.396))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
