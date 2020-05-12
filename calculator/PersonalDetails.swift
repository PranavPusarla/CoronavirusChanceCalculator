//
//  PersonalDetails.swift
//  CovidCalculator
//
//  Created by Chandrasekhar pusarla on 5/10/20.
//  Copyright © 2020 Pranav Pusarla. All rights reserved.
//

import Foundation
import SwiftUI

struct CovidChance: Codable {
    let data: Float
}

class Api {
    func send_data(age: String, temperature: String, high_risk_exp: String, high_risk_inter: String, diabetes: String, chd: String, htn: String, cancer: String, asthma: String, copd: String, autoimmune: String, rhonchi: String, wheezes: String, cough: String, fever: String, fatigue: String, headache: String, runny_nose: String, sore_muscles: String, sore_throat: String) {
        var covidchance = Float(0.0)
        let list = [age, high_risk_exp, high_risk_inter, diabetes, chd, htn, cancer, asthma, copd, autoimmune, temperature, rhonchi, wheezes, cough, fever, fatigue, headache, runny_nose, sore_muscles, sore_throat]
        guard let encoded = try? JSONEncoder().encode(list) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "http://127.0.0.1:8000/createPost")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField:"Content-type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil else {
                print("No data in response")
                return
            }
        }.resume()
        
    }
    
    func get_data(completion: @escaping (Float) -> ()) {
        let second_url = URL(string: "http://127.0.0.1:8000/getChanceOfCovid")!
        var second_request = URLRequest(url: second_url)
        second_request.setValue("application/json", forHTTPHeaderField:"Content-type")
        second_request.httpMethod = "GET"
        URLSession.shared.dataTask(with: second_request, completionHandler: { data, response, error in
            do {
                guard let secure_data = data else { return }
                let loaded = try JSONDecoder().decode(CovidChance.self, from: secure_data)
                let covidchance = loaded.data
                completion(covidchance)
            }
            catch {
                print(error.localizedDescription)
            }
        }).resume()
    }
}

struct PersonalDetailsView: View {
    @State var age = ""
    @State var temperature = ""
    @State var high_risk_exp = ""
    @State var high_risk_inter = ""
    @State var diabetes = ""
    @State var chd = ""
    @State var htn = ""
    @State var cancer = ""
    @State var asthma = ""
    @State var copd = ""
    @State var autoimmune = ""
    @State var rhonchi = ""
    @State var wheezes = ""
    @State var cough = ""
    @State var fever = ""
    @State var fatigue = ""
    @State var headache = ""
    @State var runny_nose = ""
    @State var sore_muscles = ""
    @State var sore_throat = ""
    @State var covidchance = Float(0.0)
    @State var showResult = false
    
    func get_covidchance() -> Float {
        return covidchance
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing:25) {
                Text("COVID-19 Calculator")
                    .bold()
                    .font(.title)
                    .padding(.top)
                    .foregroundColor(.blue)
                VStack {
                    HStack(spacing: 16) {
                        Text("Age: ")
                        TextField("Age", text: $age).keyboardType(.numberPad)
                    }
                    HStack(spacing: 16) {
                        Text("Temperature °C: ")
                        TextField("Temperature in Celsius", text:$temperature).keyboardType(.decimalPad)
                    }
                }.padding(.horizontal)
                VStack(spacing:10) {
                    HStack(spacing: 86) {
                        Text("Have you had any high-risk exposure?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $high_risk_exp)
                    }
                    HStack(spacing: 56) {
                        Text("Have you had any high-risk interactions?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $high_risk_inter)
                    }
                    HStack(spacing: 93) {
                        Text("Do you have diabetes?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $diabetes)
                    }
                    HStack(spacing: 39) {
                        Text("Do you have congenital heart disease?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $chd)
                    }
                    HStack(spacing: 80) {
                        Text("Do you have high blood pressure?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $htn)
                    }
                    HStack(spacing: 106) {
                        Text("Do you have cancer?")
                        RadioButtons(selected: $cancer)
                    }
                    HStack(spacing: 104) {
                        Text("Do you have asthma?")
                        RadioButtons(selected: $asthma)
                    }
                    HStack(spacing: 14) {
                        Text("Do you have COPD (Chronic Obstructive Pulmonary Disease)?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $copd)
                    }
                    HStack(spacing: 40) {
                        Text("Do you have any autoimmune diseases?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $autoimmune)
                    }
                }.padding(.horizontal)
                VStack(spacing:10) {
                    HStack(spacing: 25) {
                        Text("Are you making low-pitched or rattling sounds when breathing?").fixedSize(horizontal: false, vertical: true)
                        RadioButtons(selected: $rhonchi)
                    }
                    HStack(spacing: 125) {
                        Text("Are you wheezing?")
                        RadioButtons(selected: $wheezes)
                    }
                    HStack(spacing: 127) {
                        Text("Are you coughing?")
                        RadioButtons(selected: $cough)
                    }
                    HStack(spacing: 112) {
                        Text("Do you have a fever?")
                        RadioButtons(selected: $fever)
                    }
                    HStack(spacing: 80) {
                        Text("Do you have any fatigue?")
                        RadioButtons(selected: $fatigue)
                    }
                    HStack(spacing: 76) {
                        Text("Do you have a headache?")
                        RadioButtons(selected: $headache)
                    }
                    HStack(spacing: 65) {
                        Text("Do you have a runny nose?")
                        RadioButtons(selected: $runny_nose)
                    }
                    HStack(spacing: 63) {
                        Text("Do you have sore muscles?")
                        RadioButtons(selected: $sore_muscles)
                    }
                    HStack(spacing: 67) {
                        Text("Do you have a sore throat?")
                        RadioButtons(selected: $sore_throat)
                    }
                }.padding(.horizontal)

                
                Button(action: {
                    Api().send_data(age: self.age, temperature: self.temperature, high_risk_exp: self.high_risk_exp, high_risk_inter: self.high_risk_inter, diabetes: self.diabetes, chd: self.chd, htn: self.htn, cancer: self.cancer, asthma: self.asthma, copd: self.copd, autoimmune: self.autoimmune, rhonchi: self.rhonchi, wheezes: self.wheezes, cough: self.cough, fever: self.fever, fatigue: self.fatigue, headache: self.headache, runny_nose: self.runny_nose, sore_muscles: self.sore_muscles, sore_throat: self.sore_throat)
                    Api().get_data(completion: { float in
                        self.covidchance = float
                    })
                    self.showResult = true
                }) {
                    Text("Submit")
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(40)
                }.popover(isPresented: $showResult) {
                    Result(showResult: self.$showResult, covidchance: self.$covidchance) // will show you at the end
                }
            }
        }
    }
}

struct PersonalDetails_Previews: PreviewProvider {
    static var previews: some View {
        Text("Print hello world")
    }
}

extension View {

    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
}


// MARK: - NavigateModifier
fileprivate struct NavigateModifier<SomeView: View>: ViewModifier {

    // MARK: Private properties
    fileprivate let destination: SomeView
    @Binding fileprivate var binding: Bool


    // MARK: - View body
    fileprivate func body(content: Content) -> some View {
        NavigationView {
            ZStack {
                content
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(destination: destination
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                               isActive: $binding) {
                    EmptyView()
                }
            }
        }
    }
}

