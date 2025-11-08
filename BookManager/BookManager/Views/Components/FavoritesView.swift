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
    private var favoriteBooks: [Binding<Book>] {
        filterFavorityBooks(
            books: $books,
            selectedGenre: selectedGenre,
            selectedStatus: selectedReadingStatus
            
        )
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
                if (favoriteBooks.isEmpty){
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
                        ForEach(favoriteBooks, id:\.id){ book in
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
    

func filterFavorityBooks(
    books: Binding<[Book]>,
    selectedGenre: Genre?,
selectedStatus: ReadingStatus?,
    isNegative: Bool? = false
    
) -> [Binding<Book>]{
    books.filter {
        $0.wrappedValue.isFavorite
        && (
            selectedGenre == nil
            || $0.wrappedValue.genre == selectedGenre
        )
        && (
            selectedStatus == nil
            || $0.wrappedValue.readingStatus == selectedStatus
        )
    }
}
