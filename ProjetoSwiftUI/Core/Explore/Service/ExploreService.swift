//
//  ExploreService.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 09/11/23.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview().listings
    }
}
