//
//  PostData.swift
//  CovidCalculator
//
//  Created by Chandrasekhar pusarla on 5/11/20.
//  Copyright © 2020 Pranav Pusarla. All rights reserved.
//

import SwiftUI

struct PostData: View {
    var decisions = ["Yes", "No"]
    @State private var selectedDecision = 0

    var body: some View {
        Text("Hello Worlds")
    }
}

struct PostData_Previews: PreviewProvider {
    static var previews: some View {
        PostData()
    }
}
