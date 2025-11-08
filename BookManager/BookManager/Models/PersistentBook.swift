//
//  PersistentBook.swift
//  BookManager
//
//  Created by Nar Rasaily on 11/3/25.
//

import Foundation
import SwiftData

@Model
class PersistentBook{
    var title: String
    var author: String
    var imageData: Data?
    var summary: String // it could be Nil because it ends with question mark ?
    var genre: Genre
    var rating: Int
    var review: String
    var readingStatus: ReadingStatus
    var isFavorite: Bool
    
    init(
        bookTitle: String,
        imageData: Data? = nil,
        author: String = "",
        summary: String? = "",
        
        genre: Genre = Genre.unknown,
        rating: Int = 0,
        review: String = "",
        readingStatus: ReadingStatus = ReadingStatus.unknown,
        isFavorite: Bool = false
        )
    {
        self.title = bookTitle
        self.imageData = imageData
        self.author = author
        self.summary = summary ?? ""
        self.genre = genre
        self.rating = rating
        self.review = review
        self.readingStatus = readingStatus
        self.isFavorite = isFavorite
    }
    func getNameAndAuthor() -> String {
        if(!self.author.isEmpty){
            return "\(self.title) - \(self.author)"
        }
        return"\(self.title) by unknown Author"
    }
}
