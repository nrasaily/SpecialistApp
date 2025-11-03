//
//  FavoritesView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//
import SwiftUI
struct FavoritesView: View {
    
    @Binding var books: [Book]
    @State private var showFilterView: Bool = false
    @State private var selectedGenre: Genre?
    @State private var selectedReadingStatus: ReadingStatus?
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // Computed variables
    private var favoritesBooks: [Binding<Book>] {
        $books.filter {
            $0.wrappedValue.isFavorite
            && (
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
        NavigationStack{
            if (selectedGenre != nil || selectedReadingStatus != nil){
                HStack{
                    
                    
                    if (selectedGenre != nil){
                        Text("Genre")
                        CustomCapsule(selectedGenre!.rawValue)
                    }
                    if (selectedReadingStatus != nil){
                        Text("Status")
                        CustomCapsule(selectedReadingStatus!.rawValue)
                    }
                }.padding()
            }
            ScrollView{
                if (favoritesBooks.isEmpty){
                    VStack{
                        Image(systemName: "book.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                        Text("No Favorite Books Found")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }.padding()
                }else {
                    LazyVGrid(columns: gridLayout) {
                        ForEach(favoritesBooks, id:\.id){ book in
                            // Text(book.wrappedValue.title)
                            
                            NavigationLink(destination: DetailView(book: book)) {
                                BookCard(book: book)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle(" My Favorites Books")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    FilterButton(action: {
                        showFilterView.toggle()
                    })
                        
                    
                }
            }
            .sheet(isPresented: $showFilterView) {
                
            } content: {
                FiltersView(
                    selectedGenre: $selectedGenre,
                    selectedReadingStatus: $selectedReadingStatus
                )
            }
        }
    }
}
    

