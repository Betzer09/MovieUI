//
//  HomeView.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to MovieUI")
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
