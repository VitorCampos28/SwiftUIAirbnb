//
//  ExploreView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 30/10/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                ScrollView {
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32, content: {
                        ForEach(viewModel.listings) { item in
                            NavigationLink(value: item) {
                                ListingItemView(listing: item)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    })
                }
                .padding()
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
