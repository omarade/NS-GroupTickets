//
//  ContentView.swift
//  NsGroupTravel
//
//  Created by Omar on 22/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView
        {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                
                NavigationLink(destination: CreateGroup(), label: {
                    Text("Next")
                })
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
