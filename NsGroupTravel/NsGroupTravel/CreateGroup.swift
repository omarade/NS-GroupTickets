//
//  CreateGroup.swift
//  NsGroupTravel
//
//  Created by Alexandru Aciobanitei on 30/10/2022.
//

import SwiftUI

struct CreateGroup: View {
    
    
    private let Cities: [City] = [
        City(name: "Amsterdam", uicCode: ""),
        City(name: "Eindhoven", uicCode: "8400196"),
        City(name: "Groeningen", uicCode: ""),
        City(name: "Rotterdam", uicCode: "8400530"),
        City(name: "The Hague", uicCode: ""),
        City(name: "Utrecht", uicCode: ""),
    ]
    
    
    var destinationsReturned = [String]()
    
    @State private var isExpanded = false
    @State private var selectedDeparture = "Eindhoven"
    
    @State private var isExpandedA = false
    @State private var selectedCityA = "Rotterdam"
    
    @State private var isExpandedD = false
    @State private var selectedCityD = 1
    
    @State private var isExpandedT = false
    @State private var selectedCityT = 1
    
    @State private var isExpandedDummy = false
    @State private var selectedDestination = "Eindhoven"
    
    
    private struct City: Identifiable, Codable {
        let name: String
        var id: String {name}
        var uicCode: String
    }
    
    
    func fetchAPI(originUicCode: String, destinationUicCode: String) -> Array<String>{
        var temp = [String]()
        print("intra aici")
        let nsAPI: String =    "https://gateway.apiportal.ns.nl/reisinformatie-api/api/v2/departures?uicCode=\(originUicCode)"
        
        let session = URLSession.shared
        let url = URL(string: nsAPI)!
        var request = URLRequest(url: url)
        request.addValue("", forHTTPHeaderField: "Authorization")
        request.addValue("631471a5163c46658173282af3fdf607", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        
        let dataTask = session.dataTask(with: request) {data, response, error in
            print("aia zic")
            let destFunc = [String]()

            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let response = response as? HTTPURLResponse
                if response?.statusCode == 200 {
                    DispatchQueue.main.async {
                        do {
                            let jsonObject = try JSONSerialization.jsonObject(with: data)
                            
                            if let arr = jsonObject as? [String: Any] {
                                if case let results as NSDictionary = arr["payload"] {
                                    for (key, value) in results {
                                        if key as! String == "departures"{
                                            if case let val as NSArray = value {
                                                for i in val {
                                                    if case let dest as NSDictionary = i {
                                                        for (keyDest, valueDest) in dest {
                                                            if keyDest as! String == "direction" {
                                                                if valueDest as! String == destinationUicCode {
                                                                    let time = dest["plannedDateTime"] as! String
                                                                   print(time)
    
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            } else {
                                                print("Error")
                                            }
                                            
                                        }
                                    }
                                } else {
                                    print("n-a mers")
                                }
                                DispatchQueue.main.async {
//                                    let departures = arr["departures"] as! Any
//                                    print(departures)
                                }
                            }
                            
                        } catch {
                            print(error)
                        }
                        
                    }
                }
                
            }
            temp = destFunc
        }
            
            dataTask.resume()
        return temp

        }
    
    
    
        
    
    func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        urlSession.resume()
    }
}
        
        var body: some View {
            NavigationView{
                ScrollView
                {
                    VStack(alignment: .leading, spacing: 15){
                        
                        Text("Create new group")
                            .frame(maxWidth: .infinity)
                            .font(.largeTitle)
                            .padding(.top, 20)
                        
                        Text("Select departure").font(.title3)
                            .padding(.top, 50)
                            .padding(.leading)
                        //                    DisclosureGroup("Select departure", isExpanded: $isExpanded) {
                        ////                        ForEach(1...Cities.count, id:\.self) { destination in
                        ////                            Text(destinations[destination])
                        ////                        }
                        //                        for ()
                        //                    }
                        DisclosureGroup("\(selectedDeparture)", isExpanded: $isExpanded) {
                            VStack(alignment: .center) {
                                
                                ForEach(1...5, id: \.self) { num in
                                    Text("\(Cities[num].name)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedDeparture = Cities[num].name
                                            print(self.fetchAPI(originUicCode: "8400206", destinationUicCode: "Deurne"))
                                            withAnimation {
                                                self.isExpanded.toggle()
                                            }
                                        }
                                }
                            }
                            
                        }
                        .accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all, 20)
                        .background(Color.gray)
                        .cornerRadius(30)
                        
                        Text("Select arrival").font(.title3)
                            .padding(.top)
                            .padding(.leading)
                        
                        DisclosureGroup("\(selectedCityA)", isExpanded: $isExpandedA) {
                            VStack(alignment: .center) {
                                
                                ForEach(1...5, id: \.self) { num in
                                    Text("\(Cities[num].name)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedCityA = Cities[num].name
                                            withAnimation {
                                                self.isExpandedA.toggle()
                                            }
                                        }
                                }
                            }
                            
                        }
                        .accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all, 20)
                        .background(Color.gray)
                        .cornerRadius(30)
                        
                        Text("Select Date").font(.title3)
                            .padding(.top)
                            .padding(.leading)
                        
                        DisclosureGroup("\(selectedCityD)", isExpanded: $isExpandedD) {
                            VStack(alignment: .center) {
                                
                                ForEach(1...5, id: \.self) { num in
                                    Text("\(num)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedCityD = num
                                            withAnimation {
                                                self.isExpandedD.toggle()
                                            }
                                        }
                                }
                            }
                            
                        }
                        .accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all, 20)
                        .background(Color.gray)
                        .cornerRadius(30)
                        
                        Text("Select time").font(.title3)
                            .padding(.top)
                            .padding(.leading)
                        
                        DisclosureGroup("\(selectedCityT)", isExpanded: $isExpandedT) {
                            VStack(alignment: .center) {
                                
                                ForEach(1...5, id: \.self) { num in
                                    Text("\(num)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedCityT = num
                                            withAnimation {
                                                self.isExpandedT.toggle()
                                            }
                                        }
                                }
                            }
                            
                        }
                        .accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all, 20)
                        .background(Color.gray)
                        .cornerRadius(30)
                        
                        Spacer()
                    }
                    
                    .padding(.all)
                    
                    
                    NavigationLink(destination: GroupConfirm(), label: {
                        Text("Create")
                    })
                }
            }
        }
    }



struct CreateGroup_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroup()
    }
}
