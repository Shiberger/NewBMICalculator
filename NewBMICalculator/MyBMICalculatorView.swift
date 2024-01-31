//
//  MyBMICalculatorView.swift
//  NewBMICalculator
//
//  Created by Hannarong Kaewkiriya on 31/1/2567 BE.
//

import SwiftUI

struct MyBMICalculatorView: View {
    //Variable for BMI Calculation
    @State var myWeight: String = ""
    @State var myHeight: String = ""
    @State var myBMIResult: String = ""
    @State var isMetric: Bool = true // Flag to track if metric or imperial units are selected

    //Variable Controlling Alert for Input Validation
    @State var showAlert: Bool = false

    //Hide Keyboard Function
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    //Input Validation Function
    private func checkInput() {
        if (isMetric && (Double(self.myWeight) != nil) && (Double(self.myHeight) != nil)) || (!isMetric && (Double(self.myWeight) != nil) && (Double(self.myHeight) != nil)) {
            self.bmiCalculationMethod()
        } else {
            self.showAlert = true
        }
    }

    //BMI Value Calculation Function
    private func bmiCalculationMethod() {
        let weightMultiplier = isMetric ? 1.0 : 0.453592 // Convert to kg if not metric
        let heightMultiplier = isMetric ? 1.0 : 0.3048 // Convert to m if not metric
        let myWeight = Double(self.myWeight)! * weightMultiplier
        let myHeight = Double(self.myHeight)! * heightMultiplier
        let myHeightConverted = myHeight / 100.0
        let myBMIResult = myWeight / (myHeightConverted * myHeightConverted)
        self.myBMIResult = self.bmiResultInterpretation(bmiValue: myBMIResult)
    }

    //BMI Value Interpretation Function
    private func bmiResultInterpretation(bmiValue: Double) -> String {
        var result: String = "BMI Value = \(bmiValue) \n"
        if bmiValue >= 35.0 {
            result += "Individuals with a BMI of 35 or greater fall into the obese category. This indicates a significant excess of body weight and may be associated with health risks."
        } else if bmiValue >= 28.5 {
            result += "Individuals with a BMI in the range of 23.51 to 34.99 are categorized as overweight. This suggests an excess amount of body weight relative to height"
        } else if bmiValue >= 23.5 {
            result += "Individuals with a BMI in the range of 18.51 to 28.49 are considered to have a normal weight, indicating a healthy balance between height and weight."
        } else if bmiValue >= 18.5 {
            result += "Normal Weight. You"
        } else {
            result += "Individuals with a BMI below 18.5 are considered underweight. This may indicate insufficient body weight relative to height."
        }
        return result
    }

    var body: some View {
        ZStack {
            Color.init(red: 239.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0)
            VStack {
                TextField("Weight", text: $myWeight)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.white)
                    .offset(y: 20)
                    .keyboardType(.decimalPad)

                TextField("Height", text: $myHeight)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.white)
                    .offset(y: 25)
                    .keyboardType(.decimalPad)

                HStack {
                    Button(action: {
                        self.checkInput()
                        self.hideKeyboard()
                    }) {
                        Text("Confirm")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                    .alert(isPresented: $showAlert) {
                        () -> Alert in
                        return Alert(title: Text("BMICalculator"), message: Text("Please check your input"), primaryButton: .cancel(Text("Close")), secondaryButton: .default(Text("Clear"), action: {
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
                .offset(y: 35)

                Text("\(myBMIResult)")
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .offset(y: 50)

                Spacer()
            }
            .padding(.horizontal, 15)
            .navigationBarTitle("BMI Calculation")
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

#Preview {
    MyBMICalculatorView()
}
