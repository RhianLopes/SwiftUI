//
//  RepositoriesListViewModel.swift
//  SwiftHub
//
//  Created by Rhian Lopes da Costa on 27/10/20.
//

import SwiftUI

class RepositoriesListViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    
    init() {
        fetchData()
    }
    
    private func fetchData() {
        let search = SearchAPIURLProvider(endpoint: .search(language: "swift"))
        
        Requester.request(search: search) { [weak self] (result: Result<SearchResult, APIError>) in
            switch result {
            case .success(let searchResult):
                guard let strongSelf = self else { return }
                
                DispatchQueue.main.async {
                    strongSelf.repositories = searchResult.items
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
