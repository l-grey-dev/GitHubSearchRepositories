//
//  Home.swift
//  GitHubSearchRepositories
//
//  Created by Sergey Lukaschuk on 25.12.2020.
//

import SwiftUI


struct Home: View {
    
    @StateObject var searchData = SearchRepository()
    var body: some View {
        VStack {
            CostumSearchBar(searchData: searchData)
            Spacer()
        }
        .onChange(of: searchData.query) { (newData) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if newData == searchData.query {
                    print("search \(newData)")
                    if searchData.query != "" {
                        searchData.find()
                    }
                    else {
                        searchData.searchRepository.removeAll()
                    }
                }
            }
        }
    }
}


