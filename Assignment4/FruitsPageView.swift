//
//  Fruits.swift
//  Assignment4
//
//  Created by Morgan Pence on 9/20/23.
//


import SwiftUI

struct Fruit: Codable, Identifiable {
    var id: Int
    var name: String
    var family: String
    var nutritions: FruitDetails

}

struct FruitDetails: Codable {
    var calories: Int
    var fat: Double
    var sugar: Double
    var carbohydrates: Double
    var protein: Double
    
}

struct FruitsPageView : View {
    @State var fruits = [Fruit]()
    @State var fruitDetails = [FruitDetails]()
    @State var selectedFruit: Fruit?
    
    func getAllFruits() async -> () {
        do {
            let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            fruits = try JSONDecoder().decode([Fruit].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        NavigationView {
            List(fruits) { fruit in
                VStack(alignment: .leading) {
                    Text("\(fruit.name) • \(fruit.family)")
                    Button("Nutrition Info") {
                        selectedFruit = fruit
                    }
                    
                }
                
            }
            .task {
                await getAllFruits()
            }
            .sheet(item: $selectedFruit){ fruit in
                SheetView(fruit: fruit)
            }
        }
        .navigationTitle("Fruit")
    }
    
}

struct FruitsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsPageView()
    }
}

