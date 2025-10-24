//
//  ContentView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var books: [Book] = [
        Book(
            title: "The Fellowship of the Ring",
            author: "J.R.R. Tolkien",
            image: "lotr_fellowship",
            description: ""
        ),
        Book(
            title: "The Two Towers",
            author: "J.J.R Tolkien",
            image: "lotr_towers"
        ),
        Book(
            title: "Return of the King",
            author: "J.R.R. Tolkien",
            image: "lotr_king"
            )
        
    ]
    
    var body: some View {
        NavigationStack {
            List(books, id: \.title) { book in
                // Each book will display the following
                NavigationLink(destination: DetailView()){
                HStack{
                    Image(book.image ?? "")
                        .resizable()
                    
                        .frame(width: 50, height: 70)
                    VStack(alignment: .leading) {
                        
                        Text(book.title)
                        Text(book.author)
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }
                    }
                }
            }
                
            
            
            .navigationBarTitle("Book Manager") // Adds titlte on top
        }
        
    }
}

#Preview {
    ContentView()
}
