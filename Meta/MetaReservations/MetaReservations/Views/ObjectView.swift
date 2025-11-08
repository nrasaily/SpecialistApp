 //
//  ObservedObject.swift
//  MetaReservations
//
//  Created by Nar Rasaily on 11/5/25.
//

// step 1
import SwiftUI

struct ObservedObject: View {
    
    @ObservedObject private var model = Model()
    var body: some View {
        VStack {
            List{
                ForEach(model.meals) { meal in
                    Text(meal.name)
                }
            }
        }
    }
}

#Preview {
    ObservedObject()
}

struct Meal: Identifiable {
    var id: UUID = UUID()
    var name: String
}


// step 2
class Model: ObservableObject {
    // Properties willl go here step 3
    @Published var meals: [Meal] = menuMeals()
    static func menuMeals() -> [Meal] {
        return [
            Meal(name: "Lasangna"),
            Meal(name: "Pizza"),
            Meal(name: "Pasta"),
            Meal(name: "Ramen"),
            Meal(name: "Tortellina"),
            Meal(name: "Wrap"),
            Meal(name: "Sushi")
        ]
    }
}
