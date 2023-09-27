//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by João Pedro Soares on 25/09/2023.
//

import SwiftUI

struct DetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            HStack{
                Spacer()
                
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
            
            Spacer()
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString)!)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(framework: MockData.sampleFramework,
                   isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
