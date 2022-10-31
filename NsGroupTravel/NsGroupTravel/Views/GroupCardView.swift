//
//  GroupCardView.swift
//  NsGroupTravel
//
//  Created by Omar on 26/10/2022.
//

import SwiftUI

struct GroupCardView: View {
    var group: Group
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Label("Main Ticket Holder", systemImage: "ticket")
                Spacer()
                Text(group.createdBy["name"] ?? "")
            }
            .padding(.bottom, 5)
//            HStack {
//                Label("Date", systemImage: "")
//                Spacer()
//                Text(group.date)
//            }
            
            HStack {
                Label("Date & Time", systemImage: "calendar.badge.clock")
                    //.foregroundColor(Color.red)
//                Text(String(group.freeSpots))
                Spacer()
                Text(group.date)
            }
            .padding(.bottom, 5)
            Label("\(group.freeSpots) Spots Left", systemImage: "person.3")
                .foregroundColor(Color.red)
                .frame(maxWidth: .infinity)
                //.border(.black)
        }
        .font(.system(size: 15))
        .padding()
    }
}

struct GroupCardView_Previews: PreviewProvider {
    static var group = Group(id: "test", freeSpots: 3, createdBy: ["id": "1", "name": "Omar", "email": "omar@gmail.com", "phoneNr": "061234567"], date: "2023-04-07 10:45")
    
    static var previews: some View {
        GroupCardView(group: group)
    }
}
