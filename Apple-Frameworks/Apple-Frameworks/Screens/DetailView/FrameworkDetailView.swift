//
//  DetailView.swift
//  Apple-Frameworks
//
//  Created by João Pedro Soares on 25/09/2023.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            
            XDismissButton(isShowingModal: $viewModel.isShowingDetailView.wrappedValue)
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: URL(string: viewModel.framework.urlString)!) {
                Label("Learn More", systemImage: "book.fill")
            }
            
//            Button {
//                viewModel.isShowingSafariView = true
//            } label: {
////                AFButton(title: "Learn More")
//                Label("Learn More", systemImage: "book.fill")
//            }
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
//            .tint(.red)
            
        }
        .fullScreenCover(isPresented: $viewModel.isShowingSafariView) {
            SafariView(url: URL(string: viewModel.framework.urlString)!)
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework,
                                                                isShowingDetailView: .constant(false)))
            .preferredColorScheme(.dark)
    }
}
