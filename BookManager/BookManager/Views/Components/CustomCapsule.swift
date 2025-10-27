//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/25/25.
//

import SwiftUI
struct CustomCapsule: View {
    
    let text: String
    
    var color: Color
    
    init(_ text:String, color: Color = .accentColor.opacity(0.5)){
        self.text = text
        self.color = color
    }
    
    var body: some View {
        
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color)
            .clipShape(Capsule())
    }
}
