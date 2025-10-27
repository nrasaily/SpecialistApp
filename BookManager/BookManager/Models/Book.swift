//
//  Book.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/15/25.
//
import Foundation

struct Book: Identifiable{
    let id = UUID()
    var title: String
    var author: String = ""
    var image: String = "default_book"
    var description: String = ""// it could be Nil because it ends with question mark ?
    var rating: Int = 0
    var review: String = ""
    var isFavorite: Bool = false
    var readingStatus: ReadingStatus = .unknown
    var genre: Genre = .unknown
}
