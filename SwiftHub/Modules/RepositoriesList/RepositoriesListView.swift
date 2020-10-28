//
//  RepositoriesListView.swift
//  SwiftHub
//
//  Created by Rhian Lopes da Costa on 27/10/20.
//

import SwiftUI

struct RepositoriesListView: View {
    
    @ObservedObject var viewModel = RepositoriesListViewModel()
    
    init() {
        configNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repositories) { repo in
                    RepositoryListView(repo)
                }
            }
            .navigationBarTitle("Repositories", displayMode: .large)
        }
    }
}

struct RepositoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        let view = RepositoriesListView()
        view.viewModel.repositories = [.mocked, .mocked, .mocked]
        
        return view
    }
}
