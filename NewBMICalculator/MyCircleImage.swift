//
//  MyCircleImage.swift
//  NewBMICalculator
//
//  Created by Hannarong Kaewkiriya on 7/2/2567 BE.
//

import SwiftUI

struct MyCircleImage: View {
    var body: some View {
        //Adding Image Object and its' Modifiers
        Image("tonkra")
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 15)
    }
}

#Preview {
    MyCircleImage()
}
