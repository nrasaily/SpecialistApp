import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage(SETTINGS_THEME_KEY) var theme: Theme = SETTINGS_THEME_DEFAULT_VALUE
    @AppStorage(SETTINGS_ACCENT_COLOR_KEY) private var accentTintColor: Color = SETTINGS_ACCENT_COLOR_DEFAULT_VALUE
    
    @State var books: [Book] = getBooks()

    var colorScheme: ColorScheme? {
        switch(theme) {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
    
    var body: some View {
        TabView {
            BookListView(books: $books)
                .tabItem {
                    Label("Books", systemImage: "books.vertical.fill")
                }
            FavoritesView(books: $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                
        }
        .preferredColorScheme(colorScheme)
        //add this only if time to add the color
        .tint(accentTintColor)
    }
}

#Preview {
    ContentView()
}

