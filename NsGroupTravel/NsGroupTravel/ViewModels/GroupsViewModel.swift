//
//  GroupViewModel.swift
//  NsGroupTravel
//
//  Created by Omar on 27/10/2022.
//

import Foundation
import FirebaseFirestore

class GroupsViewModel: ObservableObject {
    @Published var groups = [Group]()
    @Published var route: Route?
    
    private var db = Firestore.firestore()

    //Get Route by Departure & Destination
    func fetchRouteByPlaces(departure: String, destination: String) {
        let docRef = db.collection("routes").whereField("departure", isEqualTo: departure).whereField("destination", isEqualTo: destination)
        
        docRef.getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting docs: \(err)")
            }
            else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let id = document.documentID
                                    
                    let departure = data["departure"] as? String ?? ""
                    let destination = data["destination"] as? String ?? ""
                    
                    self.fetchGroups(id: id)
                    
                    self.route =  Route(id: id, departure: departure, destination: destination, groups: self.groups)
                    
                }
            }
            
        }
    }
    
    //get routes by id
    func fetchRouteBy(id: String) {
        let docRef = db.collection("routes").document(id)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let id = document.documentID
                
                
                if let data = data {
                    
                    let departure = data["departure"] as? String ?? ""
                    let destination = data["destination"] as? String ?? ""
                    
                    self.fetchGroups(id: id)
                    
                    self.route =  Route(id: id, departure: departure, destination: destination, groups: self.groups)
                    
                }
                
            } else {
                print("Document does not exist")
            }
            
        }
    }
       
    //get subcollection groups
    func fetchGroups(id: String){
        let groupsRef = db.collection("routes").document(id).collection("groups")
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        
        groupsRef.addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No Docs")
                return
            }
            
            self.groups = documents.map { (queryDocumentSnapshot) -> Group in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID

                let date = data["dateTime"] as? String ?? ""
                let freeSpots = data["free_spots"] as? Int ?? 0
                let createdBy = data["created_by"] as? [String: String] ?? ["": ""]
                
                return Group(id: id, freeSpots: freeSpots, createdBy: createdBy, date: date)
            }
        }
    }
    
}
