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
    @State private var showingSheet = false
    
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
            List(fruits) { fruits in
                VStack(alignment: .leading) {
                    Text("\(fruits.family) • \(fruits.name)")
                    Button("Nutrition Info") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SheetView(fruits : fruits)
                    }
                    
                }
            }
            .task {
                await getAllFruits()
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

