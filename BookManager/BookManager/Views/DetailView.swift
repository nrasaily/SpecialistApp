//
//  DetailView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/15/25.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var book: Book
    
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 20){
                HStack{
                    // Colescing operator (?? ) if left side is nil do the right sside
                    Image(book.image ?? "default_book")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical, 20)
                    VStack{
                        Text(book.title)
                            .font(.system(size: 36, weight: .bold, design: .serif))
                        if(book.author != ""){
                            Text("by \(book.author)")
                                .font(.headline)
                                .foregroundStyle(.secondary)
                            Text("Genre: \(book.genre.rawValue)")
                                .font(.headline)
                                .foregroundStyle(.secondary)
                        }
                    
                            
                    }
                    
                }
                HStack{
                    
                    
                    CustomCapsule(book.readingStatus.rawValue)
                    Spacer()
                    //Text(book.description != "" ? book.description : "No description")
                    FavoriteToggle(isFavorite: $book.isFavorite)
                }
                    
                Text(book.description != "" ? book.description : "No description")
                    // Ternary operator (? :) if logical check is true, do after"?" else do after the ""
                // logical operator
                if(book.review != "" || book.rating > 0){
                    Text("My Review").font(.subheadline)
                    if(book.rating > 0){
                        CustomCapsule("Rating: \(book.rating) \(book.rating > 1 ? "stars" : "star")")
                    }
                    Text(book.review != "" ? book.review : "No review yet")
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle(book.title ?? "Book") // sets title
        .navigationBarTitleDisplayMode(.inline) // Changes the title to be smallar
        .navigationBarItems(trailing: Button("Edit", action: {showEditSheet.toggle()})) /// sets button on the top right corner with the text edit
        .sheet(
            isPresented: $showEditSheet,
            content: {
                AddEditBookView(book: $book)
            }
        )// Show sheet whenever $showEdsitSheet is true
       
    }
}
//#Preview {
//    DetailView(book: $book)
//}
