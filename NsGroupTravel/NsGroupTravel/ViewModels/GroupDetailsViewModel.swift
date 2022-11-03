//
//  GroupDetailsViewModel.swift
//  NsGroupTravel
//
//  Created by Omar on 03/11/2022.
//

import Foundation
import FirebaseFirestore

class GroupDetailsViewModel: ObservableObject {
    @Published var group: Group?
    
    private var db = Firestore.firestore()
    
    //get routes by id
    func fetchGroupBy(id: String) {
        let docRef = db.collection("groups").document(id)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data()
                let id = document.documentID
                
                
                if let data = data {
                    
                    let departure = data["departure"] as? String ?? ""
                    let destination = data["destination"] as? String ?? ""
                    
                    
                    
                    
                }
                
            } else {
                print("Document does not exist")
            }
            
        }
    }
}
