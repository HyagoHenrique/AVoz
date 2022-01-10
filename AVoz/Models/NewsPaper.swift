//
//  Newspaper.swift
//  AVoz
//
//  Created by Hyago Henrique on 01/01/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Newspaper: Codable, Identifiable {
    @DocumentID var id: String?
    var pdfURL: String?
    var image: String?
    var edition: Int?
    var year: String?
    var month: String?
}
