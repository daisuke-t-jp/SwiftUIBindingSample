//
//  DetailView.swift
//  SwiftUIBindingSample
//
//  Created by Daisuke TONOSAKI on 2019/11/26.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI
import KeyboardObserving

struct DetailView: View {
    @Binding var person: Person
    
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "JPY"
        formatter.maximumFractionDigits = 0
        formatter.maximumIntegerDigits = 8
        return formatter
    }
    
    
    var body: some View {
        VStack {
            // Header
            Group {
                Text(person.name).font(.title)
                Spacer().frame(height: 10)
                Divider()
                Spacer().frame(height: 10)
            }
            
            // Gender
            Group {
                Text("Gender")
                .font(.headline)
                
                pickerGender
                
                Spacer().frame(height: 10)
            }
            
            // Age
            Group {
                pickerAge
                
                Spacer().frame(height: 10)
            }
            
            // Glasses
            Group {
                Toggle(isOn: $person.hasGlasses) {
                    Text("Glasses")
                }
                
                Spacer().frame(height: 10)
            }
            
            // Pocket Money
            Group {
                Text("Pocket Money")
                    .font(.headline)
                
                TextField("",
                          value: $person.pocketMoney,
                          formatter: currencyFormatter)
                    .frame(width: 300.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer().frame(height: 300)
            }
            
            Spacer()
            
        }
        .padding()
        .keyboardObserving()
    }

    var pickerGender: some View {
        Picker(selection: $person.gender,
               label: Text("Select gender.")) {
                Text("male").tag(Person.Gender.male)
                Text("female").tag(Person.Gender.female)
        }
        .pickerStyle(SegmentedPickerStyle())
    }

    var pickerAge: some View {
        Picker(selection: $person.age,
               label: Text("Age")) {
                ForEach(0 ..< 100) { index in
                    Text(String("\(index)")).tag(index)
                }
        }
        .pickerStyle(WheelPickerStyle())
    }

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        return DetailView(person: .constant(Person()))
    }
}

