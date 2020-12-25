//
//  CostumSearchBar.swift
//  GitHubSearchRepositories
//
//  Created by Sergey Lukaschuk on 25.12.2020.
//

import SwiftUI

struct CostumSearchBar: View {
    @ObservedObject var searchData: SearchRepository
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                TextField("Search", text: $searchData.query)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchRepository.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(searchData.searchRepository, id: \.node_id) { repository in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(repository.fullName)
                                Divider()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }
                .frame(height: 240)
            }
        }
        .background(Color.init(.darkGray))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}







