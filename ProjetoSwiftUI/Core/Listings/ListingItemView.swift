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
            Rectangle()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // listing details
            
            HStack(alignment: .top, content: {
                // details
                VStack(alignment: .leading, content: {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4, content: {
                        Text("$567")
                            .fontWeight(.semibold)
                        
                        Text("Night")
                    })
                })
                
                Spacer()
                
                HStack(spacing: 2, content: {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                })
                // rating
            })
            .font(.footnote)
            
        })
        .padding()
    }
}

#Preview {
    ListingItemView()
}
