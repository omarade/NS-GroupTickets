//
//  GroupDetailView.swift
//  NsGroupTravel
//
//  Created by Omar on 02/11/2022.
//

import SwiftUI

struct GroupDetailView: View {
    
    @ObservedObject private var groupDetailsModelView = GroupDetailsViewModel()

    init (id: String) {
        self.groupDetailsModelView.fetchGroupBy(id: id)
    }
    
    var body: some View {
        
        Text("Group \(self.groupDetailsModelView.group?.id ?? "")")
        
        List {
            //Group Detail
            Section(header: Text("Info")) {
                HStack {
                    Label("Departure", systemImage: "train.side.front.car")
                    Spacer()
                    Text(self.groupDetailsModelView.group?.departure ?? "")
                }
                HStack {
                    Label("Destination", systemImage: "train.side.rear.car")
                    Spacer()
                    Text(self.groupDetailsModelView.group?.destination ?? "")
                }
                
                HStack {
                    Label("Created By", systemImage: "person.circle")
                    Spacer()
                    ForEach(groupDetailsModelView.members) { member in
                        if (member.creator){
                            Text(member.name)
                        }
                    }
                    
                }
                
                HStack {
                    Label("Date & Time", systemImage: "clock")
                    Spacer()
                    Text(self.groupDetailsModelView.group?.date ?? "")
                }
                
                HStack {
                    Label("Available Spots", systemImage: "clock")
                    Spacer()
                    Text("\(self.groupDetailsModelView.group?.freeSpots ?? 1)")
                }

            }
            
            //Group Members
            Section(header: Text("Members")) {
                ForEach(groupDetailsModelView.members) { member in
                    Section{
                        VStack{
                            HStack{
                                Label("Name", systemImage: "person")
                                Spacer()
                                Text(member.name)
                            }
                            
                        
                            HStack{
                                Label("Email", systemImage: "mail")
                                Spacer()
                                Text(member.email)
                            }
                            
                            HStack{
                                Label("Tickts Number", systemImage: "ticket")
                                Spacer()
                                Text("\(member.ticktesNr)")
                            }
                            
                        }
                    }
                }
            }
        }

    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GroupDetailView(id: "")
    }
}
