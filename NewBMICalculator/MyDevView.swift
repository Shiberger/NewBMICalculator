//
//  MyDevView.swift
//  NewBMICalculator
//
//  Created by Hannarong Kaewkiriya on 7/2/2567 BE.
//

import SwiftUI

struct MyDevView: View {
    
    @State var myVariable : String = ""
    
    @State var myDisplayVariable : String = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                MyCircleImage()
                    .gridCellAnchor(.center)
                
                VStack {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("My Developer Profile")
                        .foregroundColor(Color(hue: 0.429, saturation: 0.945, brightness: 0.66))
                    
                    TextField("Please Enter Your Information.", text: $myVariable)
                    
                    HStack {
                        Button("Save") {
                            self.myDisplayVariable = self.myVariable
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: 45)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .border(Color.blue, width: 1)
                        
                        Button("Clear") {
                            self.myVariable = ""
                            self.myDisplayVariable = ""
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                               maxHeight: 45)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .border(Color.red, width: 1)
                    }
                    Text("\(myDisplayVariable)")
                    NavigationLink(destination : MainView()){
                        Text("Go to Next Page")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                                   maxHeight: 45)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                    }
                }
                .padding()
            }
            .navigationTitle("My Developer View")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


#Preview {
    MyDevView()
}
