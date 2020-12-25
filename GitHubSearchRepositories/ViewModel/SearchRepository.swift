//
//  SearchRepository.swift
//  GitHubSearchRepositories
//
//  Created by Sergey Lukaschuk on 25.12.2020.
//

import SwiftUI

class SearchRepository: ObservableObject {
    @Published var searchRepository: [Repository] = []
    
    @Published var query = ""
    
    @Published var page = 1
    
    func find() {
        let url = "https://api.github.com/search/repositories?q\(query)"
    
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            guard let jsonData = data else { return }
            
            do {
                let repositorys = try JSONDecoder().decode(Results.self, from: jsonData)
                DispatchQueue.main.async {
                    self.searchRepository.append(contentsOf: repositorys.items)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
