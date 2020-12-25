//
//  ContentView.swift
//  GitHubSearchRepositories
//
//  Created by Sergey Lukaschuk on 25.12.2020.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("GitHub Search Repositories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

