//
//  RadioButton.swift
//  CovidCalculator
//
//  Created by Chandrasekhar pusarla on 5/11/20.
//  Copyright © 2020 Pranav Pusarla. All rights reserved.
//

import Foundation
import SwiftUI

struct RadioButtons: View {
    @Binding var selected: String
//    @Binding var show: Bool
    
    var body: some View {
        HStack {
            ForEach(data, id: \.self) { word in
                Button(action: {
                    self.selected = word
                }) {
                    HStack {
                        Text(word)
                        ZStack {
                            Circle().fill(self.selected == word ? Color("Color") : Color.black.opacity(0.2)).frame(width: 18, height: 18)
                            if (self.selected == word) {
                                Circle().stroke(Color("Color1"), lineWidth: 4).frame(width: 18, height: 18)
                            }
                        }
                    }
                }.foregroundColor(.black)
            }
        }
    }
}

var data = ["Yes", "No"]

struct RadioButton_Previews: PreviewProvider {
    
    static var previews: some View {
        Text("Hello World")
    }
}

