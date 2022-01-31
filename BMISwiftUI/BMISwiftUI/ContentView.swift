//
//  ContentView.swift
//  BMISwiftUI
//
//  Created by Danny Wade on 31/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    
    var body: some View {
        VStack {
        Text("BMI Calculator:")
                .font(.largeTitle)
            
        TextField("Enter Weight (in kilograms)",text: $weightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
            
            TextField("Enter Height (in metres)", text: $heightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
            
            Button(action: {
                
                var weight: Double = 0
                var height: Double = 0
                
                if let weightDouble = Double(self.weightText) {
                    weight = weightDouble
                }
                if let heightDouble = Double(self.heightText) {
                    height = heightDouble
                }
                self.bmi = weight/(height * height)
                
                if self.bmi < 18.5 {
                    self.classification = "Underweight"
                }
                else if self.bmi < 24.9 {
                    self.classification = "Healthy Weight"
                }
                else if self.bmi < 29.9 {
                    self.classification = "Overweight"
                }
                else {
                    self.classification = "Obese"
                }
            }){
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            
            Text("BMI: \(bmi, specifier: "%.1f"), \(classification)")
                .font(.title)
                .padding()
        } .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
