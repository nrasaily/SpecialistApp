//
//  bookListView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//
import SwiftUI

struct BookListView: View {
    
    @Binding var books: [Book]
    @State var showAddSheet: Bool = false
    @State var newBook: Book = Book(title: "")
    

var body: some View {
    NavigationStack {
        List($books, id: \.self.title) { $book in
            // Each book will display the following:
            NavigationLink(destination: DetailView(book: $book)) {
                BookListItem(bookInList: $book)
            }
        }
        .navigationBarTitle("Book Manager") // Adds title on top
        .navigationBarItems(
            trailing: Button("Edit") {
                showAddSheet.toggle()
            }
        )
        // Adds button on top right corner with text "Edit"
        .sheet(isPresented: $showAddSheet) {
            if !newBook.title.isEmpty {
                books.append(newBook)
            }
        
            newBook = Book(title: "")
            } content: {
                AddEditBookView(book: $newBook)
            }
        }
    }
}

