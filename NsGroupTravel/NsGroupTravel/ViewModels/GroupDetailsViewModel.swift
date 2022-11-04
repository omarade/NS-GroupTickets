//
//  GroupDetailsViewModel.swift
//  NsGroupTravel
//
//  Created by Omar on 03/11/2022.
//

import Foundation
import FirebaseFirestore

class GroupDetailsViewModel: ObservableObject {
    @Published var group: GroupDto?
    @Published var members = [Member]()
    
    private var db = Firestore.firestore()
    
    //get group by id
    func fetchGroupBy(id: String) {
        let docRef = db.collection("groups").document(id)

        print(id)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let id = document.documentID
                            
                if let data = data {

                    let departure = data["departure"] as? String ?? ""
                    let destination = data["destination"] as? String ?? ""
                    let date = data["dateTime"] as? String ?? ""
                    let freeSpots = data["free_spots"] as? Int ?? 0
                    
                    self.fetchMembers(id: id)
                    
                    self.group = GroupDto(id: id, departure: departure, destination: destination, date: date, freeSpots: freeSpots, members: self.members)
                }

            } else {
                print("Document does not exist")
            }

        }
    }
    
    //get subcollection members
    func fetchMembers(id: String){
        let groupsRef = db.collection("groups").document(id).collection("members")
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm"
        
        groupsRef.addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No Docs")
                return
            }
            
            self.members = documents.map { (queryDocumentSnapshot) -> Member in
                let data = queryDocumentSnapshot.data()
                
                let id = queryDocumentSnapshot.documentID

                let name = data["name"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let phoneNr = data["phone_nr"] as? String ?? ""
                let ticketsNr = data["tickets_nr"] as? Int ?? 0
                let creator = data["creator"] as? Bool ?? false
                
                return Member(id: id, name: name, email: email, phoneNr: phoneNr, ticktesNr: ticketsNr, creator: creator)
            }
        }
    }
}
