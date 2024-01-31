//
//  ContentView.swift
//  NewBMICalculator
//
//  Created by Hannarong Kaewkiriya on 31/1/2567 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack { //Start VStack
                NavigationLink(destination: MyBMICalculatorView()) {
                    Image("BMI")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                Text("BMI Calculator")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:-75)
                    .padding(.bottom, -75)
                
                NavigationLink(destination: UnitConverterView()) {
                    Image("BMI")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                Text("Unit Converter")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:-75)
                    .padding(.bottom, -75)
                
                NavigationLink(destination: MyDevView()) {
                    Image("Developer")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                Text("About Developer")
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:-75)
                    .padding(.bottom, -75)
            }
            .navigationTitle("BMI Calculator")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MainView()
}
