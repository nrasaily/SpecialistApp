//
//  Item.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/15/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
