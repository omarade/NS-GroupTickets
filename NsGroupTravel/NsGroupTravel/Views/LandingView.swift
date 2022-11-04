//
//  LandingView.swift
//  NsGroupTravel
//
//  Created by Omar on 02/11/2022.
//

import SwiftUI

struct LandingView: View {
    @State private var startBtnClicked = false
    
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor(named: "yellow")!), Color.white]), startPoint: .top, endPoint: .bottom)
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44, maxHeight: 150)

                
                VStack (alignment: .center) {
                    Text("Wellcome to NS Groups App")
                        .bold()
                        .padding(.bottom)
                        .foregroundColor(Color(UIColor(named: "darkBlue")!))
                    Text("Here you can make or find & join groups of maximum 7 travel companions to make use of the NS Offer (Off-Peak Group Ticket)")
                        .padding(.bottom, 30)
                        .frame(maxWidth: 330)
                        .multilineTextAlignment(.center
                        )
                        .foregroundColor(Color(UIColor(named: "darkBlue")!))
                    
                    Link(destination: URL(string: "https://www.ns.nl/producten/en/meest-gekocht/p/groepsticket-daluren?gclid=Cj0KCQjwqoibBhDUARIsAH2OpWj90hugX3LfRuL1jhWq3nzOKQpzYh7_u84kS69P2nsxzsQpQ-6PGf0aAnhhEALw_wcB")!) {
                        VStack {
                            Image(systemName: "train.side.front.car")
                            Text("Visit The NS Site For More Info")
                        }
                    }
                    .padding(.bottom, 30)
                    
                    Button(action: {self.startBtnClicked.toggle()}) {
                        
                        Text("Get Started")
                            .frame(minWidth: 100, maxWidth: 200, minHeight: 44, maxHeight: 50, alignment: .center)
                        
                        
                    }
                    .background(Color(UIColor(named: "darkBlue")!))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: RoutesChoiceView(), isActive: $startBtnClicked){
                        
                    }
                    .frame(maxWidth: 0, maxHeight: 0)
                    .hidden()
                    .disabled(true)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 24))
                    
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor(named: "yellow")!), Color.white]), startPoint: .bottom, endPoint: .top)
                    
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44, maxHeight: 150)
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Test")
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
