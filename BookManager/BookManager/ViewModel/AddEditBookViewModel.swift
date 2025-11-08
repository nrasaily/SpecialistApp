//
//  AddEditBookViewModel.swift
//  BookManager
//
//  Created by Nar Rasaily on 11/5/25.
//

import Foundation
import SwiftData
import SwiftUI



@MainActor
class AddEditBookModel: ObservableObject {
    private var bookToEdit: PersistentBook?
    private var modelContext: ModelContext
    
    @Published var title: String = ""
    @Published var author: String = ""
    @Published var summary: String = ""
    @Published var rating: Int = 0
    @Published var review: String = ""
    @Published var readingStatus: ReadingStatus = ReadingStatus.unknown
    @Published var genre: Genre = Genre.unknown
    @Published var isFavorite: Bool = false
    @Published var cover: UIImage? = nil
    
    var isSaveButtonDisabled: Bool  {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        (
            title == bookToEdit?.title &&
            author == bookToEdit?.author &&
            summary == bookToEdit?.summary &&
            rating == bookToEdit?.rating &&
            review == bookToEdit?.review &&
            readingStatus == bookToEdit?.readingStatus &&
            genre == bookToEdit?.genre &&
            isFavorite == bookToEdit?.isFavorite
        )
        
        
    }
    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        self.bookToEdit = book
        self.modelContext = modelContext
        
        // if the book is not nil (There is a bok to edit selected) we will set the properties with the values of the current selecgted book
        if let book {
            self.title = book.title
            self.author = book.author
            self.summary = book.summary
            self.rating = book.rating
            self.review = book.review
            self.readingStatus = book.readingStatus
            self.genre = book.genre
            self.isFavorite = book.isFavorite
            self.cover = book.imageData.flatMap(UIImage.init)
            
            
        }
    }
    func save() {
        
        let isNewBook = bookToEdit == nil
        
        let bookToSave = bookToEdit ?? PersistentBook(bookTitle: "")
        bookToSave.title = title
        bookToSave.author = author
        bookToSave.summary = summary
        bookToSave.rating = rating
        bookToSave.review = review
        bookToSave.readingStatus = readingStatus
        bookToSave.genre = genre
        bookToSave.isFavorite = isFavorite
        if isNewBook {
            modelContext.insert(bookToSave)
            return
        }
        do {
            try modelContext.save()
        } catch {
            print("Failed To save The Book \(error)")
        }
    }
}

