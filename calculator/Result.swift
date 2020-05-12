//
//  Result.swift
//  CovidCalculator
//
//  Created by Chandrasekhar pusarla on 5/11/20.
//  Copyright © 2020 Pranav Pusarla. All rights reserved.
//

import SwiftUI

struct Result: View {
    @Binding var showResult: Bool
    @Binding var covidchance: Float
    var body: some View {
        VStack(spacing: 150) {
            VStack(spacing:30) {
                Text("The chance of having coronavirus is")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                Text(String(format: "%.2f%%", covidchance))
                    .bold()
                    .font(.system(size: 60))
            }
            Button(action: {
                self.showResult = false
                print(self.covidchance)
            }) {
                Text("Go Back <-")
                    .fontWeight(.bold)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(40)
            }
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}
