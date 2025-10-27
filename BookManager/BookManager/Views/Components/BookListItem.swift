//
//  BookListItem.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/23/25.
//
import SwiftUI

struct BookListItem: View {
    
    @Binding var bookInList: Book
    //var book: Book
    var body: some View {
        
        
        HStack{
            Image(bookInList.image ?? "book_default")
                .resizable()
            
                .frame(width: 50, height: 70)
            VStack(alignment: .leading) {
                
                Text(bookInList.title)
                Text(bookInList.author ?? "Anonymous")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }
}
