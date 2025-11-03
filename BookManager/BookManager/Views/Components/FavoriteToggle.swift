//
//  FavoriteToggle.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//

import SwiftUI

struct FavoriteToggle: View {
    @Binding var isFavorite: Bool
    @State private var opacity: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var offsetY: CGFloat = 0
    var body: some View {
        
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
                .font(.largeTitle)
                .opacity(opacity)
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
            .accessibilityLabel(isFavorite ? "Remove from favorites" : "Add to favorites")
            .onChange(of: isFavorite){ oldValue, newValue in
                guard newValue else { return }
                // continue if guard logic is true
                withAnimation(.spring(response:0.5, dampingFraction:
                                                0.4)){
                    opacity = 1
                    scale = 1.2
                }
                              // Float and vanish
                withAnimation(.easeInOut(duration:0.5).delay(0.3)){
                    opacity = 0
                    offsetY = -100
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    scale = 1
                    offsetY = 0
                    
                }
            }
        }
        
    }
}
