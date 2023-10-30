//
//  ListingItemView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI

struct ListingItemView: View {

    
    var body: some View {
        VStack(spacing: 8, content: {
            // Images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listing details
            
            HStack(alignment: .top, content: {
                // details
                VStack(alignment: .leading, content: {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4, content: {
                        Text("$567")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("Night")
                            .foregroundStyle(.black)
                    })
                })
                
                Spacer()
                
                RatingView(withReviews: false)
                    .foregroundStyle(.black)
            })
            .font(.footnote)
            
        })
    }
}

#Preview {
    ListingItemView()
}
