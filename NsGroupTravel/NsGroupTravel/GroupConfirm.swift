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
                
                Text("Congratulations!")
                    .frame(maxWidth: .infinity)
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Text("You have created a new group.")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                    .offset(y: -25)
                    .font(.title3)
                
                Text("You can find more details below.")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                    .offset(y: -50)
                
                
                Image(systemName: "checkmark.seal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top)
                    .offset(y:100)
                    .opacity(0.3)
                
                NavigationLink(destination: TripsView(), label: {
                    Text("My Trips")
                        .padding(.top, 250)
                        .font(.title2)
                        
                })
                
                NavigationLink(destination: GroupView(), label: {
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
