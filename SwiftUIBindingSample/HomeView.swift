//
//  HomeView.swift
//  SwiftUIBindingSample
//
//  Created by Daisuke TONOSAKI on 2019/11/26.
//  Copyright © 2019 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appData: AppData
    @State var draftPerson = Person()
    
    var personIndex: Int {
        appData.persons.firstIndex(where: { $0.id == draftPerson.id })!
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Persons")
                    .font(.largeTitle)
                
                List {
                    ForEach(appData.persons) { person in
                        NavigationLink(destination: DetailView(person: self.$draftPerson).onAppear {
                            self.draftPerson = person
                        }.onDisappear {
                            self.appData.persons[self.personIndex] = self.draftPerson
                            }
                        ) {
                            PersonRowView(person: person)
                                .frame(height: 48)
                        }
                    }
                }
            }
            .padding()
            .navigationBarTitle(Text("Index"))
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
