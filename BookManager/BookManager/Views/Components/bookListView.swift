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
    
    
    @State private var showFilterSheet: Bool = false
    @State private var selectedGenre: Genre?
    @State private var selectedReadingStatus: ReadingStatus?
    
    // Computed Variable
        private var filteredBooks: [Binding<Book>] {
            
                
            
            $books.filter {
                (
                    selectedGenre == nil
                    || $0.wrappedValue.genre == selectedGenre
                )
                && (
                    selectedReadingStatus == nil
                    || $0.wrappedValue.readingStatus == selectedReadingStatus
                )
            }
        }
    
var body: some View {
    NavigationStack {
        VStack {
            if filteredBooks.isEmpty {
                Text("No books found.")
                    .font(.headline)
            }
            
            List(filteredBooks, id: \.id) { $book in
                // Each book will display the following:
                NavigationLink(destination: DetailView(book: $book)) {
                    BookListItem(bookInList: $book)
                }
            }
        }
        .navigationBarTitle("Book Manager") // Adds title on top
        .navigationBarItems(
            trailing: Button("Add") {// Adds button on top right corner with text "Edit"
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
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        showFilterSheet.toggle()
                    }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                    .accessibilityLabel("Open filter options")
                }
            }
            
            .sheet(isPresented: $showFilterSheet) {
                
            } content: {
                FiltersView(
                    selectedGenre: $selectedGenre,
                    selectedReadingStatus: $selectedReadingStatus
                )
            }
        }
    }
}

