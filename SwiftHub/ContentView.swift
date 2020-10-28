//
//  ContentView.swift
//  SwiftHub
//
//  Created by Elias Medeiros on 26/10/20.
//

import SwiftUI

struct ContentView: View {
    func onAppear() {
        let search = SearchAPIURLProvider(endpoint: .search(language: "swift"))
        Requester.request(search: search) { (result: Result<SearchResult, APIError>) in
            switch result {
            case.success(let searchResult):
                print("registros: \(searchResult.totalCount)")
            case .failure(let error):
                print(error)
            }
        }
    }

    var body: some View {
        Text("Teste")
            .padding()
            .onAppear(perform: onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
