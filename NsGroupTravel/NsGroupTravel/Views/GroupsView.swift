//
//  GroupsSView.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import SwiftUI

struct GroupsView: View {
    
    //view model database layer
    @ObservedObject private var groupViewModel = GroupViewModel()
    
    //Fetch Data On Init
    init(departure: String, destination: String) {
        //get routes
        self.groupViewModel.fetchRouteByPlaces(departure: departure, destination: destination)
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    //Show Selected Route
                    VStack {
                        Text("\(self.groupViewModel.route?.departure ?? "")")
                            .padding(4)
                        Label("", systemImage: "arrow.right")
                        Text("\(self.groupViewModel.route?.destination ?? "")")
                            .padding(4)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                }
                
                //Show List of Found Groups
                Section {
                    List  {
                        
                        ForEach(groupViewModel.groups) { group in
                            NavigationLink (destination: GroupCardView(group: group)) {
                                GroupCardView(group: group)
                                    .frame(maxWidth: .infinity, maxHeight: 100)
                                    
                            }
                            .listRowInsets(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 10))
                            
                        }

                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                
                
            }
            
            
        }
        .navigationTitle("Groups")
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
            GroupsView(departure: "Amesterdam Central", destination: "Eindhoven Central")
    }
}
