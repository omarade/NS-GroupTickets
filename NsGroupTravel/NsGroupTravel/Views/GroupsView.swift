//
//  GroupsSView.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import SwiftUI

struct GroupsView: View {
    @State private var date = Date()
    @State private var ticketsNr = 1
    
    //view model database layer
    @ObservedObject private var groupsViewModel = GroupsViewModel()
    
    //Fetch Data On Init
    init(departure: String, destination: String) {
        //get routes
        self.groupsViewModel.fetchRouteByPlaces(departure: departure, destination: destination)
    }
    
    var body: some View {
        
        Form {
            Section (header: Text("Selected Route")) {
                //Show Selected Route
                HStack {
                    Text("\(self.groupsViewModel.route?.departure ?? "")")
                        .padding(.trailing, 2)
                    Label("", systemImage: "arrow.right")
                    Text("\(self.groupsViewModel.route?.destination ?? "")")
                        .padding(.leading, 2)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .font(.system(size: 13))
            }
            
            
            Section(header: Text("Filter")) {
                DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date]
                )
                Stepper("Availabel Tickets: \(ticketsNr)", value: $ticketsNr, in: 1...6)
            }
            
            
            //Show List of Found Groups
            Section(header: Text("Groups Found").frame(alignment: .leading)) {
                List  {
                    ForEach(groupsViewModel.groups) { group in
                        NavigationLink (destination: GroupCardView(group: group)) {
                            GroupCardView(group: group)
                                .frame(maxWidth: .infinity, maxHeight: 100)
                                
                        }
                        .listRowInsets(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 10))
                        
                    }

                }
                
            }
//            .frame(maxWidth: .infinity, maxHeight: 150)
            
            
        }
        .navigationTitle("Groups")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Group")
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupsView(departure: "Amesterdam Central", destination: "Eindhoven Central")
        }
    }
}
