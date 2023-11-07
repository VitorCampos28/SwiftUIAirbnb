//
//  LoginButton.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 07/11/23.
//

import SwiftUI

struct LoginButton: View {
    var body: some View {
        
        Button {
            print("Log in")
        } label: {
            Text("Log in")
        }
    }
}


struct LoginButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 48)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    LoginButton()
}
