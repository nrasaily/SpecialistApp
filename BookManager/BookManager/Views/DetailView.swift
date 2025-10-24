//
//  DetailView.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/15/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .center, spacing: 20){
                HStack{
                    Image("lotr_king")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                        .padding(.vertical, 20)
                    VStack{
                        Text("Title is really long and should wrap")
                            .font(.system(size: 36, weight: .bold, design: .serif))
                        Text("by \("Author")")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            
                    }
                    
                }
                Text("The Fellowship of the Ring by J.R.R. Tolkien is the first volume of The Lord of the Rings trilogy. It follows the journey of Frodo Baggins, a humble hobbit who inherits a powerful and dangerous ring from his uncle Bilbo. When Gandalf the wizard reveals that the ring belongs to the Dark Lord Sauron, Frodo sets out on a perilous quest to destroy it in the fires of Mount Doom. Along the way, he is joined by a fellowship of companions, each with their own reasons for seeking the ring's destruction. ")
                    
            }
            .padding(.horizontal, 16)
        }
    }
}
