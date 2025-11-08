//
//  PersistentBook.swift
//  BookManager
//
//  Created by Nar Rasaily on 11/3/25.
//

import Testing
@testable import BookManager
@MainActor @Suite("Models -- Persistent book Tests")

struct PersistentBookTests {
    @Test("Should create an instance of persistent book, when initialized with valid parameters")
    func testPersistentbookInitializer() {
        // Arrange
        let bookTitle = "Test Title"
        let status = ReadingStatus.finished
        let author = "Test Auth"
        let isFavority = false
        let actual = PersistentBook(bookTitle: bookTitle, author: author, readingStatus: status, isFavorite: isFavority)
        

        #expect(actual.readingStatus == ReadingStatus.finished)
     
        #expect(actual.isFavorite == false)
    }
    @Test("Should return a string with only title followed by the string 'by the unknown author'; when called with a book only title")
    func testDescriptionWithUnknownAuthor() {
        // Arrange
        let bookTitle = "Test Book1"
        
        // Act
        let actualBook = PersistentBook(bookTitle: bookTitle)
        let actualResult = actualBook.getNameAndAuthor()
        
        //Assert
        #expect(actualBook.author == "Test book1 by the unknown author")
    }
    
}
