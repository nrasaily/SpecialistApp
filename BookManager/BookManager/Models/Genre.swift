//
//  Genre.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//

import Foundation

enum Genre: String, CaseIterable, Codable {
    case fiction
    case nonFiction
    case selfHelp
    case romance
    case scienceFiction
    case fantasy
    case mystery
    case horror
    case biography
    case unknown

}
