//
//  MainTabView.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image("home_tab")
                }
            
            CategoriesView()
                .tabItem {
                    Text("Categories")
                    Image("categories_tab")
                }
            
            ProfileView()
                .tabItem {
                    Text("Profile")
                    Image("profile_tab")
                }
        }//: Tab view
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
