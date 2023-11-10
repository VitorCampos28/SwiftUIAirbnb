//
//  ListingItemView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8, content: {
            // Images
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listing details
            
            HStack(alignment: .top, content: {
                // details
                VStack(alignment: .leading, content: {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4, content: {
                        Text("\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("Night")
                            .foregroundStyle(.black)
                    })
                })
                
                Spacer()
                
                RatingView(withReviews: false, rating: listing.rating)
                    .foregroundStyle(.black)
            })
            .font(.footnote)
            
        })
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview().listings[0])
}
