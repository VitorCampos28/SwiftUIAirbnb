//
//  ProfileView.swift
//  ProjetoSwiftUI
//
//  Created by Vitor Campos on 07/11/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32, content: {
                VStack(alignment: .leading, spacing: 8,  content:{
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                })
                
                LoginButton()
                    .modifier(LoginButtonViewModifier())
                
                HStack(content: {
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                })
                .font(.caption)
            })
            VStack(spacing: 24, content: {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            })
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
