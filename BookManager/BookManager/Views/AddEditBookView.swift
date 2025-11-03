//
//  AddEditBookView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/20/25.
//
import SwiftUI
import Foundation
struct AddEditBookView: View {
    @Binding var book: Book
    @Environment(\.dismiss) var dismiss
    @State private var workingBook: Book
    
    init(book: Binding<Book>){
        self._book = book
        self._workingBook = .init(initialValue: book.wrappedValue)
    }
   // @Binding var rating: Double
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            .gray.opacity(0.1),
                            .gray.opacity(0.3)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                VStack{
                    
                    
                    Form {
                        Section(header: Text("Book Details")) {
                            TextField("Title of the book", text: $workingBook.title)
                            TextField("Author", text: $workingBook.author)
                            TextEditor(text: $workingBook.description)
                                .frame(height: 100)
                            Picker("Genre", selection: $workingBook.genre){
                                ForEach(Genre.allCases, id: \.self){ genre in
                                    Text(genre.rawValue).tag(genre)
                                }
                            }
                        }
                        // Text("\(book.rating, specifier: "%.1f")")
                        
                        Section(header: Text("Review")){
                            Picker("Rating", selection: $workingBook.rating){
                                Text("Not rated yet").tag(0)
                                ForEach(1...5, id: \.self){ i in
                                    Text("\(i)").tag(i)
                                }
                            }
                            TextEditor(text: $workingBook.review)
                                .frame(height: 100)
                            Picker("Reading stutus", selection: $workingBook.readingStatus){
                                ForEach(ReadingStatus.allCases, id: \.self){ status in
                                    Text(status.rawValue).tag(status)
                                }
                            }
                        }
                    }
                    .navigationTitle(book.title.isEmpty ? "Add Book" : "Edit Book")
                    
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                dismiss()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Save"){
                                book.title = workingBook.title
                                book.author = workingBook.author
                                book.description = workingBook.description
                                book.genre = workingBook.genre
                                book.rating = workingBook.rating
                                book.readingStatus = workingBook.readingStatus
                                dismiss()
                            }.disabled(workingBook.title.isEmpty)
                               // .font(.title.bold())
                        }
                    }
                    // Text(book.title)
                    
                }
            }
        }
    }
}
