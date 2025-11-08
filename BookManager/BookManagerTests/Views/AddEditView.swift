//
//  AddEditView.swift
//  BookManager
//
//  Created by Nar Rasaily on 11/3/25.
//

import Testing
import SwiftUI
@testable import BookManager
@MainActor @Suite("Favorite View Tests")

// we re going to test the filter favorite
//

struct FavoriteViewTests {
    // We're going to test filter favorite books functions
    
    //AA Arrange act Assert
    
    @Test("should return an array of books containing one element, when called with an array of three books, having the array with only one book having isFavorite property set to true") // AAA arrage act and asssert
    func testFilterFunctionsWorksCorrectly() {
        // Arrange
        let arrayOfBooks: Binding<[Book]> = Binding.constant([
            Book(title: "Book1", isFavorite: true),
            Book(title: "Book2", isFavorite: false),
            Book(title: "Book3", isFavorite: false)
        ])
        //Act
        let actual = filterFavorityBooks( // [Boooks] to a binding ,[BOOK]
            books: arrayOfBooks,
            selectedGenre: nil,
            selectedStatus: nil
        )
        
        //Assert
        #expect(actual.count == 1)
        #expect(actual[0].wrappedValue.title == "Book1")
        
    }
    @Test("Should return an array of books containing two books, when called with an array of 4 books; Having the arrrray theof books conmtaining 2 books with is favority propery set to true and genre is horror ")
         func testFilterFunctionWorksCorrectlyWith() {
                // Arrange
             let genre = Genre.horror
             
             let arrayOfBooks : Binding<[Book]> = Binding.constant([
                Book(title: "Book1", genre: Genre.horror, isFavorite: true),
                Book(title: "Book2", genre: Genre.horror, isFavorite: false),
                Book(title: "Book3", genre: Genre.horror, isFavorite: false),
                Book(title: "Book4", genre: Genre.horror, isFavorite: true)
     ])
     
     //act
     let actualResult = filterFavorityBooks(
        books: arrayOfBooks,
        selectedGenre: genre,
        selectedStatus: nil
     )
     #expect(actualResult.count == 2)
     #expect(actualResult[0].wrappedValue.title == "Book1")
     #expect(actualResult[1].wrappedValue.title == "Book4")
    }
}
