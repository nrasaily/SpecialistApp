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
   // @Binding var rating: Double
    var body: some View {
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
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.description)
                        .frame(height: 100)
                    Picker("Genre", selection: $book.genre){
                        ForEach(Genre.allCases, id: \.self){ genre in
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                }
                   // Text("\(book.rating, specifier: "%.1f")")

                Section(header: Text("Review")){
                    Picker("Rating", selection: $book.rating){
                        Text("Not rated yet").tag(0)
                        ForEach(1...5, id: \.self){ i in 
                            Text("\(i)").tag(i)
                        }
                    }
                    TextEditor(text: $book.review)
                        .frame(height: 100)
                    Picker("Reading stutus", selection: $book.readingStatus){
                        ForEach(ReadingStatus.allCases, id: \.self){ status in
                            Text(status.rawValue).tag(status)
                            }
                        }
                    }
                }
               // Text(book.title)
                
            }
        }
    }
}
