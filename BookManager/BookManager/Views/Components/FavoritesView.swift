//
//  FavoritesView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//
import SwiftUI
struct FavoritesView: View {
    
    @Binding var books: [Book]
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // Computed variables
    private var favoritesBooks: [Binding<Book>]{
        $books.filter{ $0.wrappedValue.isFavorite}
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: gridLayout) {
                    ForEach(favoritesBooks, id:\.id){ book in
                   // Text(book.wrappedValue.title)
                    
                        NavigationLink(destination: DetailView(book: book)) {
                            BookCard(book: book)
                        }
                    }
                }
            }.navigationTitle(Text("Favorites"))
            
        }
    }
}
