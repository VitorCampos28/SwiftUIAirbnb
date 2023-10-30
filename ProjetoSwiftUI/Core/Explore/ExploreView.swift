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
                LazyVStack(spacing: 32, content: {
                    ForEach(1...10, id: \.self) { count in
                        Rectangle()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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