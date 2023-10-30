//
//  ExploreView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchAndFilterBar()
                Spacer(minLength: 40)
                LazyVStack(spacing: 32, content: {
                    ForEach(1...10, id: \.self) { count in
                        ListingItemView()
                    }
                })
            }
            .padding()
        }
    }
}

#Preview {
    ExploreView()
}
