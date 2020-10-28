//
//  View+UINavigationBarApperance.swift
//  SwiftHub
//
//  Created by Rhian Lopes da Costa on 27/10/20.
//

import SwiftUI

extension View {
    
    func configNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.backgroundColor = UIColor(named: "mainPurple")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
