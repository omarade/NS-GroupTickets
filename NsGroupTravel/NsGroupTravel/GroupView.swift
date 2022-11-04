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
            .padding(.top, 30)
            
            Image(systemName: "train.side.front.car")
                .resizable()
                .frame(width: 60, height: 35)
                .offset(y:-46)
                .offset(x:3)
                .foregroundStyle(Color.white)
            
            Text("04.11.2022")
                .padding(.top, -5)
                .font(.title3)
                .opacity(0.6)
            
            Group {
                
                Text("06:59")
                    .padding(.top, -10)
                    .opacity(0.8)
                
                Text("Departure")
                    .padding(.top, 40)
                    .opacity(0.4)
                    .font(.title3)
                
                Text("Eindhoven")
                    .font(.title)
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(.degrees(-90))
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(.degrees(-90))
                    .padding(.top, -5)
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(.degrees(-90))
                    .padding(.top, -5)
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(.degrees(-90))
                    .padding(.top, -5)
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(.degrees(-90))
                    .padding(.top, -5)
            
                Text("Arrival")
                    .padding(.top)
                    .opacity(0.4)
                    .font(.title3)
                
                Text("Maastricht")
                    .font(.title)
                
                
                
            }

            
            Spacer()
            
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
