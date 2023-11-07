//
//  WishListsView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 07/11/23.
//

import SwiftUI

struct WishListsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32, content: {
                
                VStack (alignment: .leading, spacing: 4, content: {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("Your can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                })
                
                LoginButton()
                    .modifier(LoginButtonViewModifier())
            })
            
            Spacer()
        }
        .padding()
        .navigationTitle("Wishlists")
    }
}

#Preview {
    WishListsView()
}
