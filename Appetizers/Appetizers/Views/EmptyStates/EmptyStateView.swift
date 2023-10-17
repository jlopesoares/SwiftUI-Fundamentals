//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by João Pedro Soares on 17/10/2023.
//

import SwiftUI

struct EmptyStateView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -10)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "empty-order", message: "This is our test message.\nI'm making it a little long for testing.")
    }
}
