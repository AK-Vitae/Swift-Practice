//
//  Petition.swift
//  Project7UIKit
//
//  Created by Ramadugu, Akshith on 8/21/22.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct Petitions: Codable {
    var results: [Petition]
}
