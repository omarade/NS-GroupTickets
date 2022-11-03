//
//  GroupConfirm.swift
//  NsGroupTravel
//
//  Created by Alexandru Aciobanitei on 30/10/2022.
//

import SwiftUI

struct GroupConfirm: View {
    var body: some View {
        
        VStack(alignment: .center){
            
            Text("Create new group")
                .frame(maxWidth: .infinity)
                .font(.largeTitle)
                .padding(.top, 20)
            
            Text("You have joined a new group.")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 3)
            Text("You can view find more details below.")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, -5)
            
            Image(systemName: "checkmark.seal")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 200)
                .opacity(0.3)
            
            NavigationLink(destination: TripsView(), label: {
                Text("My Trips")
                    .padding(.top, 150)
                    .font(.title2)
            })
            
            NavigationLink(destination: CreateGroup(), label: {
                Text("View group details")
                    .padding(.top, 5)
                    .font(.title2)
            })
            
            Spacer()
            
        }
        .padding(.all, 30)
    }
}

struct GroupConfirm_Previews: PreviewProvider {
    static var previews: some View {
        GroupConfirm()
    }
}


//    .navigationBarTitleDisplayMode(.inline)
//    .toolbar {
//        ToolbarItem(placement: .principal) {
//            Text("Congratulations!")
//                .font(.largeTitle.bold())
//                .accessibilityAddTraits(.isHeader)
//                .frame(maxWidth: .infinity, alignment: .center)
//            //.background(Color.red)
//                .padding(.top, 50)
//        }
//    }
