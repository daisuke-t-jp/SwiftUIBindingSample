//
//  PersonRowView.swift
//  SwiftUIBindingSample
//
//  Created by Daisuke TONOSAKI on 2019/11/26.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct PersonRowView: View {
    
    // MARK: Const, Enum
    static let genderMarkMap: [Person.Gender: String] = [
        .male: "♂",
        .female: "♀"
    ]
    
    static let genderColorMap: [Person.Gender: Color] = [
        .male: Color.init(red: 0.2, green: 0.5, blue: 1.0),
        .female: Color.init(red: 1.0, green: 0.45, blue: 0.45)
    ]
    
    static let glassesMark = "👓"
    static let grassesColor = Color.init(red: 0.75, green: 0.75, blue: 0.75)
    static let ageColor = Color.init(red: 0.5, green: 0.9, blue: 0.4)
    
    var person: Person
    
}

extension PersonRowView {
    
    var body: some View {
        Group {
            HStack {
                // Title
                Text(person.name)
                    .font(.headline)
                    .frame(width: 100)
                
                Spacer().frame(width: 5)
                
                
                // Gender
                ZStack {
                    Text(PersonRowView.genderMarkMap[person.gender]!)
                        .foregroundColor(.white)
                        .font(.title)
                }.frame(width: 36, height: 36)
                    .background(PersonRowView.genderColorMap[person.gender])
                    .clipShape(Circle())
                
                Spacer().frame(width: 10)
                
                
                // Age
                ZStack {
                    Text(String(person.age))
                        .foregroundColor(.white)
                        .font(.headline)
                }.frame(width: 36, height: 36)
                    .background(PersonRowView.ageColor)
                    .clipShape(Circle())
                
                Spacer().frame(width: 10)
                
                
                // Glasses
                if person.hasGlasses {
                    ZStack {
                        Text(PersonRowView.glassesMark)
                            .foregroundColor(.white)
                            .font(.title)
                    }.frame(width: 36, height: 36)
                        .background(PersonRowView.grassesColor)
                        .clipShape(Circle())
                }
                
                Spacer()
            }
            .frame(width: 280, alignment: .leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct PersonRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PersonRowView(person: Person(name: "John",
                                         gender: .male,
                                         age: 20,
                                         hasGlasses: true,
                                         pocketMoney: 0))
            PersonRowView(person: Person(name: "Sala",
                                         gender: .female,
                                         age: 21,
                                         hasGlasses: false,
                                         pocketMoney: 0))
        }
        .previewLayout(.fixed(width: 300, height: 48))
    }
}
