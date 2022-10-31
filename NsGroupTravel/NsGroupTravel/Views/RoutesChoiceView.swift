//
//  RoutesChoiceView.swift
//  NsGroupTravel
//
//  Created by Omar on 30/10/2022.
//

import SwiftUI

struct RoutesChoiceView: View {
    //Store Selected (Departure & Destination) To Be Passed To GroupsView
    @State private var selectedDeparture = "Amsterdam Central"
    @State private var selectedDestination = "Eindhoven Central"
    
    @State private var btnClicked = false
    
    //Routes Options
    var places = ["Amsterdam Central", "Rotterdam Central", "Eindhoven Central", "Maastricht Central", "Den Haag Central", "Utrecht Central"]
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section() {
                    
                    //Depatrture Picker
                    Picker(selection: $selectedDeparture, label: Text("Departure")) {
                        
                        ForEach(places, id: \.self){
                            Text($0)
                        }
                        
                    }
                    .padding(.top, 50)
                    
                    //Destination Picker
                    Picker(selection: $selectedDestination, label: Text("Destination")) {
                        ForEach(places, id: \.self){
                            Text($0)
                        }
                    }
                    .padding(.top, 15)
                    
                    //Search Groups Btn
                    Button(action: {self.btnClicked.toggle()}) {
                        HStack{
                            Label("Search For Group", systemImage: "magnifyingglass")
                                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .center)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor(named: "btn")!))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    
                    //Navigate to GroupsView on Btn Click
                    NavigationLink(destination: GroupsView(departure: selectedDeparture, destination: selectedDestination), isActive: $btnClicked){
                        
                    }
                    .frame(maxWidth: 0, maxHeight: 0)
                    .hidden()
                    .disabled(true)
                    
                    
                }
                .padding()
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationTitle("Pick a Route")
        }
    }
}

struct RoutesChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        RoutesChoiceView()
    }
}
