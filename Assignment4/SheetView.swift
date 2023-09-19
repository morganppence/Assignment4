//
//  SheetView.swift
//  Assignment4
//
//  Created by Morgan Pence on 9/19/23.
//

import SwiftUI


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    let fruits : Fruit
    
    var body: some View {
        VStack{
            Button("Press to close sheet") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(.ultraThinMaterial, in:RoundedRectangle(cornerRadius: 20, style:.continuous))
            Text("Here's that info!")
            Text("fruits : \(fruits.name)")
            Text("\(fruits.family) • \(fruits.name)")
            
                
            }
            
        }
    }

/*struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(fruits : Fruit (id: 12, name: "", family: "", calories: 10, fat: 0.0, sugar: 0.0, carbohydrates: 0.0, protein: 0.0))
    }
}*/

