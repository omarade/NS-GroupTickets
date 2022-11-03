//
//  GroupView.swift
//  NsGroupTravel
//
//  Created by Alexandru Aciobanitei on 02/11/2022.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        
        VStack{
            Circle()
            .fill(.blue)
            .frame(width: 100, height: 100)
            .offset(y:30)
            
            Image(systemName: "train.side.front.car")
                .resizable()
                .frame(width: 60, height: 35)
                .offset(y:-45)
                
            
            Spacer()
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
