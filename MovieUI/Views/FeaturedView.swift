//
//  FeaturedView.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack{
                Text("Popular Movies")
                Spacer()
            }
            
            ZStack {
                Image("JiuJistsu")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(12)
            }//: ZStack
        }//: VStack
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
