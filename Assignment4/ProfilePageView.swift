//
//  ProfilePageView.swift
//  Assignment4
//
//  Created by Morgan Pence on 9/19/23.
//

import SwiftUI

struct ProfilePageView: View {
    @State private var showingAlert = true
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack(content: {
                Text("Profile Page")
                NavigationLink("Show Confidential Information"){
                    //Text("Making it hard to get to this info ;)")
                
                }
                /*Button("Show Alert") {
                    showingAlert = true
                }*/
                .alert("Understand you are accessing personal and confidential information", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
            })
            .padding()
            .navigationBarTitle("Profile Page")
        }
    }
}
