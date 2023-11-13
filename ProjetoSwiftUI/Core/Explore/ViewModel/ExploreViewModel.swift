//
//  ExploreViewModel.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 09/11/23.
//

import SwiftUI

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingCopy = [Listing]()
    
    init(service: ExploreService)  {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func updateListingForLocation() {
        let filteredListings = listingCopy.filter({
            $0.city.lowercased().contains(searchLocation.lowercased()) ||
            $0.state.lowercased().contains(searchLocation.lowercased())
        })
        
        self.listings = filteredListings.isEmpty ? listingCopy : filteredListings
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
}
