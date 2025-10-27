//
//  BookCard.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//
import SwiftUI

struct BookCard: View {
    @Binding var book: Book
    var body: some View {
        VStack {
            
            Text(book.title)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundStyle(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(4)
                .background(Color.black.opacity(0.8))
            Spacer()
            Text(book.author)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .font(.subheadline)
                .lineLimit(1)
                .padding(4)
                .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing,))
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(book.image)
                    .resizable()
                    .scaledToFill().opacity(0.9)
        )
        
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
