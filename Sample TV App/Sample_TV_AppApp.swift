//
//  Sample_TV_AppApp.swift
//  Sample TV App
//
//  Created by Tyler Rister on 5/19/21.
//

import Introspect
import SwiftUI

@main
struct Sample_TV_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TVListView()
                    .navigationTitle(Strings.Titles.topTvShows)
                    .navigationBarTitleDisplayMode(.inline)
                    .introspectNavigationController { navigationController in
                        navigationController.navigationBar.backgroundColor = UIColor(Colors.Primary)
                        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(Colors.PrimaryContrastText)]
                        navigationController.navigationBar.barTintColor = UIColor(Colors.Primary)
                        navigationController.navigationBar.tintColor = UIColor(Colors.PrimaryContrastText)

                    }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
