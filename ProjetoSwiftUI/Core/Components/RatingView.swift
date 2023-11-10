//
//  RatingView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI

struct RatingView: View {
    var withReviews: Bool
    var rating: Double

    var body: some View {
        HStack(spacing: 2, content: {
            Image(systemName: "star.fill")
            
            Text("\(rating)")
            
            if withReviews {
                Text(" - ")
                
                Text("28 review")
                    .underline()
                    .fontWeight(.semibold)
            }
        })
    }
}

#Preview {
    RatingView(withReviews: true, rating: 4.68)
}
