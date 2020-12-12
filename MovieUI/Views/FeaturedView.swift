//
//  FeaturedView.swift
//  MovieUI
//
//  Created by Austin Betzer on 12/12/20.
//

import SwiftUI

struct FeaturedView: View {
    
    fileprivate var movie: PopularMovie
    
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
                
                VStack(spacing: 4) {
                    Text(movie.originalTitle)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.top, 125)
                    Text(movie.overview)
                        .foregroundColor(.white)                 .font(.caption)
                        .fontWeight(.heavy)
                        .lineLimit(2)
                        .padding([.leading, .trailing])
                }
                
                
            }//: ZStack
        }//: VStack
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        
        let featuredMovie = PopularMovie(id: 123, originalTitle: "Jiu Jitsu", overview: "Every six years, an ancient order of jiu-jitsu fighters joins forces to battle a vicious race of alien invaders. But when a celebrated war hero goes down in defeat, the fate of the planet and mankind hangs in the balance.", rating: 5.9, posterPath: "", backdropPath: "")
        
        FeaturedView(movie: featuredMovie)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
