//
//  FavoriteToggle.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite: Bool
    @State private var opacityCGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var offsetY: CGFloat = 0
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
                .font(.largeTitle)
            // .opacity(opacity)
                .scaleEffect(scale)
                .offset(y: offsetY)
            
            // Foreground item that is interactive
            Toggle(isOn: $isFavorite) {
                Image(systemName: isFavorite ? "heart.fill" :"heart")
                    .foregroundStyle(isFavorite ? .red : .secondary)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(.spring, value: isFavorite)
            .animation(.spring, value: isFavorite)
            .onChange(of: isFavorite){
                
                
            }
        }
        
    }
}
