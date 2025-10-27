//
//  Movie.swift
//  MovieManager
//
//  Created by Nar Rasaily on 10/26/25.
import Foundation
struct Movie: Identifiable {
    let id = UUID()
    var title: String
    var writer: String
    var director: String
    var releaseDate: Date
    var rating: Int
    var image: String
    var actor: String
    var description: String
    
   
    var isFavorite: Bool
   
    var genre: [String]
    
}

