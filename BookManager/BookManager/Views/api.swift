//
//  api.swift
//  BookManager
//
//  Created by Nar Rasaily on 10/23/25.
//

func getBooks() -> [Book] {
    return [
    Book(
        title: "The Fellowship of the Ring",
        author: "J.R.R. Tolkien",
        image: "lotr_fellowship",
        description: "Consider the positioning of the toggle—place it in a convenient location (e.g., bottom of the screen) and style it to fit the app’s design. Think about adding color contrast for better visibility and ease of use.",
        isFavorite: true
    ),
    Book(
        title: "The Two Towers",
        author: "J.J.R Tolkien",
        image: "lotr_towers",
        description: "Consider the positioning of the toggle—place it in a convenient location (e.g., bottom of the screen) and style it to fit the app’s design. Think about adding color contrast for better visibility and ease of use.",
        isFavorite: true
    ),
    Book(
        title: "Return of the King",
        author: "J.R.R. Tolkien",
        image: "lotr_king",
        description: "Consider the positioning of the toggle—place it in a convenient location (e.g., bottom of the screen) and style it to fit the app’s design. Think about adding color contrast for better visibility and ease of use.",
        isFavorite: true
        ),
    Book(
        title: "Harry Porter",
        isFavorite: true
    )
    
        
    ]
}
