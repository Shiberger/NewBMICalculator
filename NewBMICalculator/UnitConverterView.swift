//
//  MyBMICalculatorView.swift
//  NewBMICalculator
//
//  Created by Hannarong Kaewkiriya on 31/1/2567 BE.
//

import SwiftUI

struct UnitConverterView: View {
    // Variable for BMI Calculation
        @State var myWeight: String = ""
        @State var myHeight: String = ""
        @State var myBMIResult: String = ""
        @State var showAlert: Bool = false

        private func convertKgToLbs(kg: Double) -> Double {
            return kg * 2.20462
        }

        private func convertCmToFeet(cm: Double) -> Double {
            return cm * 0.0328084
        }

        private func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }

        private func checkInput() {
            if let weight = Double(self.myWeight), let height = Double(self.myHeight) {
                let weightInPounds = String(format: "%.1f", convertKgToLbs(kg: weight))
                let heightInFeet = String(format: "%.1f", convertCmToFeet(cm: height))
                
                self.myBMIResult = "Weight: \(weightInPounds) lbs, Height: \(heightInFeet) ft"
            } else {
                self.showAlert = true
            }
        }

        var body: some View {
            ZStack {
                Color(red: 239.0/255.0, green: 244.0/255.0, blue: 244.0/255.0)
                    .ignoresSafeArea()
                VStack {
                    TextField("Weight in KG", text: $myWeight)
                        .padding()
                        .background(Color.white)
                        .keyboardType(.decimalPad)
                    TextField("Height in CM", text: $myHeight)
                        .padding()
                        .background(Color.white)
                        .keyboardType(.decimalPad)
                    
                    HStack {
                        Button(action: {
                            self.checkInput()
                            self.hideKeyboard()
                        }) {
                            Text("Convert")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        .alert(isPresented: $showAlert) {
                            () -> Alert in
                            return Alert(title: Text("UnitConverter"), message: Text("Please check your input"), primaryButton: .cancel(Text("Close")), secondaryButton: .default(Text("Clear"), action: {
                                self.myWeight = ""
                                self.myHeight = ""
                                self.myBMIResult = ""
                            }))
                        }

                        Button(action: {
                            self.myWeight = ""
                            self.myHeight = ""
                            self.myBMIResult = ""
                        }) {
                            Text("Clear")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    Text("\(myBMIResult)")
                        .padding()
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("Unit Converter")
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }

#Preview {
    UnitConverterView()
}
