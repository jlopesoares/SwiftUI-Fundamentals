//
//  RemoteImage.swift
//  Appetizers
//
//  Created by João Pedro Soares on 04/10/2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image?
    
    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteView: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteView(image: imageLoader.image)
            .onAppear { imageLoader.load(from: urlString) }
    }
}
