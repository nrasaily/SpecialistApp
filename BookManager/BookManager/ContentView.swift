import SwiftUI
import SwiftData

struct ContentView: View {
    @State var books: [Book] = getBooks()
    
    
    
    var body: some View {
        TabView{
            BookListView(books: $books)
                .tabItem{
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView(books: $books)
                .tabItem{
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}
#Preview {
    ContentView()
}
