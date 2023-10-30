//
//  RatingView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI

struct RatingView: View {
    var withReviews: Bool

    init(withReviews: Bool) {
        self.withReviews = withReviews
    }

    var body: some View {
        HStack(spacing: 2, content: {
            Image(systemName: "star.fill")
            
            Text("4.86")
            
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
    RatingView(withReviews: true)
}
