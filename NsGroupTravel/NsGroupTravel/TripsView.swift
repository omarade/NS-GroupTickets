//
//  TripsView.swift
//  NsGroupTravel
//
//  Created by Alexandru Aciobanitei on 30/10/2022.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        
        VStack{
            
            Text("Your trips")
                .font(.largeTitle)
                .padding(.top, 40)
                .padding(.bottom, 40)
            
            Color.blue
                .frame(width: 350, height: 80)
                .cornerRadius(20)
            
            Text("Eindhoven - Maastricht")
                .font(.title2)
                .padding(.top, -72)
            
            Text("04.11.2022 06:59")
                .padding(.top, -60)
            
            Color.green
                .frame(width: 350, height: 80)
                .cornerRadius(20)
                .padding(.top, -20)
            
            Text("Rotterdam - Utrecht")
                .font(.title2)
                .padding(.top, -72)
            
            Text("06.11.2022 12:32")
                .padding(.top, -60)
            
            Spacer()
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
