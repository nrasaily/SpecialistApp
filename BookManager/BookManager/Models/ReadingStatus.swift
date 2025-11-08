//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/24/25.
//
enum ReadingStatus: String, CaseIterable, Codable {
    case planToRead = "Plan to Read"
    
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    case unknown = "Unknown"
}
