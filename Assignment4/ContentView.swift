//
//  ContentView.swift
//  Assignment4
//
//  Created by Morgan Pence on 9/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "sparkles")
                }
            ProfilePageView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            FruitsPageView()
                .tabItem {
                    Label("API", systemImage: "sparkles")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

